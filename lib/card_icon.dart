import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardIcon extends StatelessWidget {
  const CardIcon({super.key, required this.txt, required this.icon});
  final String txt;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.sp, color: Colors.white),
        SizedBox(height: 20.h),
        Text(txt, style: kLapeltxtGender.copyWith(fontSize: 20.sp)),
      ],
    );
  }
}
