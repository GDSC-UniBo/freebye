import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freebye/view/pages/sign_up.dart';

import '../widgets/round_button.dart';
import 'login.dart';

class LoginOrSignup extends StatelessWidget {
  static const String route = '/';

  const LoginOrSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const SizedBox(height: 80),
            Image.asset(
              "assets/images/logo.png",
              height: 250.h,
              width: 600.h,
            ),
            const SizedBox(
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: SizedBox(
                height: 40,
                child: RoundButton(
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  buttonColor: Theme.of(context).secondaryHeaderColor,
                  onTap: () => onTapSignUp(context),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: SizedBox(
                height: 40,
                child: RoundButton(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Theme.of(context).secondaryHeaderColor,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  buttonColor: Colors.white,
                  borderColor: Theme.of(context).secondaryHeaderColor,
                  onTap: () => onTapLogIn(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onTapSignUp(context) =>
      Navigator.pushReplacementNamed(context, SignUp.route);

  void onTapLogIn(context) =>
      Navigator.pushReplacementNamed(context, LogIn.route);
}
