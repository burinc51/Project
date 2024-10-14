import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gr_planner/route.dart';
import 'package:gr_planner/screens/main/main_screen.dart';
import 'package:gr_planner/themes/theme.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: GetRoutes.login,
      getPages: GetRoutes.routes,
      home: MainScreen(),
    );
  }
}
