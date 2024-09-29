import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/route.dart';
import 'package:project/screens/main/main_screen.dart';
import 'package:project/themes/theme.dart';

void main() {
  return runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme(),
      initialRoute: GetRoutes.index,
      getPages: GetRoutes.routes,
      home: MainScreen(),
    ); 
  }
}