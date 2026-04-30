import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/nav/presentation/nav_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => NavScreen()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: Center(child: Image.asset("assets/images/pop.png")),
    );
  }
}
