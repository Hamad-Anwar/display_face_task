import 'package:flutter/material.dart';

class FoodImage extends StatelessWidget {
  const FoodImage({super.key, required this.image, this.height, required this.index});
  final int index;
  final String image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),

      builder: (context, value, child) {
        return Image.asset(
            alignment: Alignment.center,
            image, height: value * (height ?? 60));
      }, duration: Duration(milliseconds:1000 + (index* 100) ),
    );
  }
}