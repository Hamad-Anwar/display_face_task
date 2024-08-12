import 'package:flutter/material.dart';

class HeadLine extends StatelessWidget {
  const HeadLine({super.key,});


  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..setRotationZ(-0.09)..rotateY(0.4),
      alignment: Alignment.center,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        builder: (context, value, child) {
          return Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: 'Mix &\n',
                    style: TextStyle(fontWeight: FontWeight.w900,fontSize:value* 50,height: 1)
                ),
                TextSpan(
                    text: 'Match!\n',
                    style: TextStyle(fontWeight: FontWeight.w900,fontSize:value* 45,height: 1)
                ),
                TextSpan(
                    text: '\$5.99',
                    style: TextStyle(fontWeight: FontWeight.w900,fontSize:value* 50,height: 1)
                ),
              ]
          ));
        }, duration: Duration(milliseconds: 800),
      ),
    );
  }
}