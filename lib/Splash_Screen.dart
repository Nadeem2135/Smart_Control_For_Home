import 'dart:core';
import 'package:flutter/material.dart';
import 'package:smart_home/Home_Screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F243B),
      body: Center(
          child: SizedBox(
            height: 100,
            width: 100,
          child: Image.asset('assets/iot.png', fit: BoxFit.cover,)
      )
      ),
    );
  }
}
