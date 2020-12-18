import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import './presentation/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xffF2F2F2),
          accentColor: Color(0xffF2F2F2),
        ),
        home: HomeView());
  }
}
