import 'package:canteen_management/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.orange,
      ),
      home:AnimatedSplash(
              imagePath: 'assets/images/logo.jpg',
              home: MyHomePage(title: 'Canteen Login'),
              duration: 4000,
              type: AnimatedSplashType.StaticDuration,
            ),
    );
  }
}

