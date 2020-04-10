import 'package:flutter/material.dart';
import 'package:highqfresh/constant/LgConstant.dart';
import 'package:highqfresh/screens/landingscreen/LandingScreen.dart';
import 'package:highqfresh/screens/splash/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: LgConstant.app_name,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: LgConstant.app_color),
        home: SplashScreen(
            seconds: 5,
            navigateAfterSeconds: new LandingScreen(),
            title: new Text(
              LgConstant.app_name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            image: Image.asset(LgConstant.app_icon_asset_path),
            backgroundColor: LgConstant.app_color,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,

            loaderColor: Colors.white));
  }
}
