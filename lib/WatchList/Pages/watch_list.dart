import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.prim_color,
     appBar:  AppBar(
  
          centerTitle: true,
          backgroundColor: Appcolor.prim_color,
          title: Text(
            'Watch list',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
      
        ),
    );
  }
}