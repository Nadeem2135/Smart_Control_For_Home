import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Home_Screen.dart';
import 'Splash_Screen.dart';
import 'Study_Room_Screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.light(useMaterial3: true),
      // darkTheme: ThemeData.dark(useMaterial3: true),
      // themeMode: ThemeMode.system,
      title: "Smart Home",
      home: SplashScreen(),
    );
  }
}
