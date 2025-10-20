import 'package:bmi_after_holiday_2/card_icon.dart';
import 'package:bmi_after_holiday_2/reusable_card.dart';
import 'package:bmi_after_holiday_2/weight_age_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constant.dart';
import 'result_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'update_card_color.dart';
import 'calculate_bmi.dart';

class RealBody extends StatefulWidget {
  const RealBody({super.key});

  @override
  State<RealBody> createState() => _RealBodyState();
}

class _RealBodyState extends State<RealBody> {
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableCard(
                  height: 200.h,
                  width: 180.w,
                  color: fristCard,
                  press: () {
                    setState(() {
                      UpdateColor updateColor = UpdateColor();
                      updateColor.updateColor(CardTyepe.male);
                    });
                  },
                  card: CardIcon(txt: 'MALE', icon: FontAwesomeIcons.mars),
                ),
                SizedBox(width: 20.w),
                ReusableCard(
                  height: 200.h,
                  width: 180.w,
                  color: secoundCard,
                  press: () {
                    setState(() {
                      UpdateColor updateColor = UpdateColor();
                      updateColor.updateColor(CardTyepe.female);
                    });
                  },
                  card: CardIcon(txt: 'FEMALE', icon: FontAwesomeIcons.venus),
                ),
              ],
            ),
          ),

          // Height card
          Expanded(
            child: ReusableCard(
              height: 200.h,
              width: 380.w,
              color: thirdCard,
              card: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLapeltxtGender.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightNum.copyWith(fontSize: 40.sp),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Cm',
                        style: ktextAppParStyl.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFFE0263),
                      overlayColor: const Color(0x29FE0263),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.r,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.r,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 120,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Weight / Age cards
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableCard(
                  height: 200.h,
                  width: 180.w,
                  color: fourthCard,
                  card: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeightAgeValues(
                        minValue: 10,
                        maxValue: 300,
                        txt: 'Weight',
                        startValue: weight.toString(),
                        onChanged: (val) {
                          setState(() {
                            weight = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                ReusableCard(
                  height: 200.h,
                  width: 180.w,
                  color: fifthCard,
                  card: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeightAgeValues(
                        txt: 'Age',
                        startValue: age.toString(),
                        minValue: 1,
                        maxValue: 120,
                        onChanged: (val) {
                          setState(() {
                            age = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Material(
            color: const Color(0xFFFE0263),
            child: InkWell(
              onTap: () {
                CalcBrain calc = CalcBrain(height, weight);

                Future.microtask(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.calcBmi(),
                        resulTxt: calc.getResult(),
                        quote: calc.getQoute(),
                      ),
                    ),
                  );
                });
              },
              child: Container(
                height: 60.h,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'CALCULATE',
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
