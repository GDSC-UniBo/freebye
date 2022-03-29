import 'package:envairo/models/position.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class User {
  static const String defaultPicture =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

  final String email;
  final String username, name;
  final String? surname;
  final String picture;
  final double? reputation;
  final int? reviewCount;

  final Position? position;

  const User(
      {required this.email,
      required this.username,
      required this.name,
      this.picture = User.defaultPicture,
      this.surname,
      this.position,
      this.reputation,
      this.reviewCount});

  static List<User> generateFake(int number) {
    return List<int>.generate(number, (i) => i + 1)
        .map((int i) => User(
            email: faker.internet.email(),
            username: faker.internet.userName(),
            name: faker.person.name()))
        .toList();
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      username: json['username'],
      name: json['name'],
      surname: json['surname'],
      position: Position.fromJson(json['position']),
    );
  }
}
