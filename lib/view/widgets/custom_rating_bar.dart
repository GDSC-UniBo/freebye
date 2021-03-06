import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;

  const CustomRatingBar({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemSize: 25.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1),
      ratingWidget: RatingWidget(
        full: Image.asset('assets/images/review_icons/heart.png'),
        half: Image.asset('assets/images/review_icons/heart_half.png'),
        empty: Image.asset('assets/images/review_icons/heart_border.png'),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
