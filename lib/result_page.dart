import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultPage extends StatefulWidget {
  final String bmiResult;
  final String resulTxt;
  final String quote;
  const ResultPage({
    super.key,
    required this.bmiResult,
    required this.resulTxt,
    required this.quote,
  });
  
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppParColor,
        leading: Icon(FontAwesomeIcons.barsStaggered, color: Colors.white),
        title: Text('Bmi Calculator', style: ktextAppParStyl),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 20.h)),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Your Result', style: kYourResult),
            ),
          ),
          SizedBox(height: 30.h),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: kButtonCardPressed,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              height: 550.h,
              width: 360.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.resulTxt.toUpperCase(),
                    style: kValueResult.copyWith(
                      color: widget.resulTxt.toLowerCase() == 'normal'
                          ? Colors.green
                          : widget.resulTxt.toLowerCase() == 'underweight'
                          ? Colors.orange
                          : Colors.red,
                    ),
                  ),
                  Text(widget.bmiResult, style: kNumbereResult),
                  Text(
                    widget.quote,
                    style: kmessageeResult,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 60.h,
              width: double.infinity,
              color: const Color(0xFFFE0263),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: ktextBUTTOMParStyl.copyWith(fontSize: 18.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
