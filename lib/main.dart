import 'package:flutter/material.dart';
import 'package:movie_app_march26/Splash/presentation/SplashScreen.dart';


void main() {
  runApp(const MovieApp());
}
// {}
// ctrl + shift + -
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen()
      );
  }
}