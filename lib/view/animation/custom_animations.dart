import 'dart:async';
import 'package:flutter/material.dart';

import '../../res/app_images.dart';
import 'components/food_image.dart';
import 'components/head_line.dart';

class CustomAnimations extends StatefulWidget {
  const CustomAnimations({super.key});

  @override
  State<CustomAnimations> createState() => _CustomAnimationsState();
}

class _CustomAnimationsState extends State<CustomAnimations> {
  double _rotationValue = 0.0;
  Timer? _animationTimer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    _animationTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      setState(() {
        _rotationValue += 0.03;
      });
    });
    await Future.delayed(const Duration(milliseconds: 3500));
    _animationTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            colors: [Colors.orangeAccent, Colors.orange],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Transform(
                transform: Matrix4.identity()..rotateZ(-_rotationValue * 0.5),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    _buildRotatedImage(AppImages.img1, 1, bottom: size.height / 2 + 40, left: 80),
                    _buildRotatedImage(AppImages.img6, 5, bottom: size.height / 2 - 70, left: 60, height: 90),
                    _buildRotatedImage(AppImages.img4, 3, bottom: size.height / 2 - 120, left: 100, height: 45),
                    _buildRotatedImage(AppImages.img3, 4, bottom: size.height / 2 - 120, right: 80),
                    _buildRotatedImage(AppImages.img5, 5, bottom: size.height / 2 - 40, right: 40, height: 70),
                    _buildRotatedImage(AppImages.img2, 6, bottom: size.height / 2 + 45, right: 80, height: 60),
                  ],
                ),
              ),
            ),
            const Center(child: HeadLine()),
          ],
        ),
      ),
    );
  }

  Widget _buildRotatedImage(
      String image,
      int index, {
        required double bottom,
        double? top,
        double? left,
        double? right,
        double? height,
      }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Transform(
        transform: Matrix4.identity()..rotateZ(_rotationValue * 0.5),
        alignment: Alignment.center,
        child: FoodImage(image: image, height: height, index: index),
      ),
    );
  }
}
