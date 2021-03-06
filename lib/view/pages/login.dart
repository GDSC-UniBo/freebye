import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freebye/view/pages/sign_up.dart';
import 'package:freebye/view/widgets/round_button.dart';
import 'package:freebye/view/widgets/textbox.dart';

import '../../src/authentication.dart';
import 'main_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);
  static const String route = '/login';

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 150),
            Image.asset(
              "assets/images/logo.png",
              width: 200,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MyTextBox(
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MyTextBox(
                hintText: "Password",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 0),
              child: SizedBox(
                height: 40,
                width: 300,
                child: RoundButton(
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  buttonColor: Theme.of(context).secondaryHeaderColor,
                  onTap: () => onTapLogIn(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: const [
                Expanded(
                    child: Divider(
                  thickness: 0.75,
                  color: Colors.black,
                  indent: 50,
                  endIndent: 20,
                  height: 40,
                )),
                Text("or"),
                Expanded(
                    child: Divider(
                  thickness: 0.75,
                  color: Colors.black,
                  indent: 20,
                  endIndent: 50,
                  height: 40,
                )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 20),
              child: SizedBox(
                height: 40,
                width: 300,
                child: RoundButton(
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Log in with Facebook",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  buttonColor: Theme.of(context).primaryColor,
                  onTap: onTapLogInFacebook,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: SizedBox(
                height: 40,
                width: 300,
                child: RoundButton(
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Log in with Google",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  buttonColor: Theme.of(context).primaryColor,
                  onTap: onTapLogInGoogle,
                ),
              ),
            ),
            const SizedBox(height: 135),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: [
                    const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          onTapToSignUp(context);
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapLogIn(context) {
    AuthenticationHelper()
        .signIn(email: emailController.text, password: passwordController.text)
        .then((result) {
      if (result == null) {
        if (kDebugMode) {
          var user = AuthenticationHelper().user!.displayName;
          print("Logged in with display name $user");
        }
        openMainPage(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            result,
            style: const TextStyle(fontSize: 16),
          ),
        ));
      }
    });
  }

  void onTapLogInFacebook() => openMainPage(context);

  void onTapLogInGoogle() => openMainPage(context);

  void openMainPage(context) =>
      Navigator.pushReplacementNamed(context, MainPage.route);

  void onTapToSignUp(context) =>
      Navigator.pushReplacementNamed(context, SignUp.route);
}
