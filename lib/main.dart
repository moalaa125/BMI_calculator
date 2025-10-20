import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'real_body.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // ✅ import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF080C1F),
            scaffoldBackgroundColor: const Color(0xFF080C1F),
          ),
          home: const Body(),
        );
      },
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppParColor,
        leading: const Icon(FontAwesomeIcons.barsStaggered, color: Colors.white),
        title: Text('BMI CALCULATOR', style: ktextAppParStyl),
        centerTitle: true,
      ),
      body: const RealBody(),
    );
  }
}
