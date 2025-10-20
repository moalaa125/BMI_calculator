import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightAgeValues extends StatefulWidget {
  const WeightAgeValues({
    super.key,
    required this.txt,
    required this.startValue,
    required this.maxValue,
    required this.minValue,
    this.onChanged,
  });

  final String txt;
  final String startValue;
  final int minValue;
  final int maxValue;
  final Function(int)? onChanged;

  @override
  State<WeightAgeValues> createState() => _WeightAgeValuesState();
}

class _WeightAgeValuesState extends State<WeightAgeValues> {
  late int currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = int.parse(widget.startValue);
  }

  void increment() {
    setState(() {
      if (currentValue < widget.maxValue) currentValue++;
      widget.onChanged?.call(currentValue);
    });
  }

  void decrement() {
    setState(() {
      if (currentValue > widget.minValue) currentValue--;
      widget.onChanged?.call(currentValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.txt, style: kLapeltxtGender),
        SizedBox(height: 8.h),
        Text(currentValue.toString(), style: kWeightAgeVlue),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: const Color(0xFF1C2033),
                onPressed: decrement,
                child: Icon(FontAwesomeIcons.minus, color: Colors.white, size: 18.sp),
              ),
            ),
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: FloatingActionButton(
                shape: CircleBorder(),
                backgroundColor: const Color(0xFF1C2033),
                onPressed: increment,
                child: Icon(FontAwesomeIcons.plus, color: Colors.white, size: 18.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
