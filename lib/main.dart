import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:comp_math_lab5/internal/dependencies.dart';
import 'package:comp_math_lab5/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  GlobalBindings().dependencies();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab work',
      theme: ThemeData.light(),
      home: AnimatedSplashScreen(
        nextScreen: MainScreen(),
        splash: 'images/yarki.png',
        duration: 100,
        splashTransition: SplashTransition.fadeTransition,
      ),
      getPages: [
        GetPage(name: MainScreen.id, page: () => MainScreen()),
      ],
    );
  }
}
