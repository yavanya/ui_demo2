import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:barbers_demo/presentation/screens/home/home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xffFF8585),
          accentColor: Color(0xffFF8585),
        ),
        home: HomeView());
  }
}
