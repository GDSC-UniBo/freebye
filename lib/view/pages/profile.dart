// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freebye/view/pages/chat_view.dart';

import '../../models/user.dart';
import '../../repositories/item_repository.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_rating_bar.dart';
import '../widgets/round_button.dart';
import 'item_grid.dart';

class Profile extends StatelessWidget {
  final User user;

  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPersonalProfile = (user == User.generatePlaceholders()[0]);

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCard(
              child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  user.picture,
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(child: Container()),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(user.name),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomRatingBar(rating: user.reputation),
                            flex: 7),
                        Expanded(
                            flex: 3,
                            child:
                                Text(user.reviewCount.toString() + " reviews")),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
          CustomCard(
              child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.check_circle_outline)),
                  Text(user.email)
                ],
              ),
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.location_pin)),
                  Text("Bologna, Italy")
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.rss_feed)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "3",
                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                        ),
                        TextSpan(
                            text: " followers, ",
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                          text: "5",
                          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
                        ),
                        TextSpan(
                            text: " followed",
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                  ),
                ],
              ),
              if (!isPersonalProfile) _interactButtons(context)
            ],
          )),
          CustomCard(
              child: Row(
            children: [
              Text(
                RepositoryProvider.of<ItemRepository>(context)
                        .countUserItems(user)
                        .toString() +
                    " advertisements",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(),
              ),
              TextButton(
                child: Row(children: const [
                  Icon(Icons.tune_outlined, color: Colors.blue),
                  Text("Filters", style: TextStyle(color: Colors.blue)),
                ]),
                onPressed: () {
                  //TODO
                },
              ),
            ],
          )),
          ItemGrid(
            items: RepositoryProvider.of<ItemRepository>(context)
                .getUserItems(user),
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }

  Widget _interactButtons(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            RoundButton(
              child: Text(
                "Message",
                style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
              buttonColor: Colors.white,
              borderColor: Theme.of(context).secondaryHeaderColor,
              onTap: () => Navigator.pushNamed(context, ChatView.route),
            ),
            const SizedBox(width: 20),
            RoundButton(
              child: const Text(
                "Follow",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
              buttonColor: Theme.of(context).secondaryHeaderColor,
              onTap: () => {
                //TODO
              },
            ),
          ],
        ));
  }
}
