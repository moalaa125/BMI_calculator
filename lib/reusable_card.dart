import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    this.press,
    required this.card,
  });

  final double height;
  final double width;
  final Color color;
  final VoidCallback? press ;
  final Widget card ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: card,
      ),
    );
  }
}
