import 'package:demo_app/core/constant/common_colors.dart';
import 'package:demo_app/module/home_screen/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: CommonColors.materialColorDeepPurple,
      ),
      home: const HomeScreen(),
    ),
  );
}