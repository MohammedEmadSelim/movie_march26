


import 'package:flutter/material.dart';

import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/core/theme/widgets/Serach_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.prim_color,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons
                .arrow_back_ios_new, // شكل سهم الـ iOS الأنيق، أو استخدم Icons.arrow_back
            color: Appcolor.seco_color, // لون السهم نفس لون النص
            size: 18, // حجم السهم
          ),
          onPressed: () {
            Navigator.pop(context); // أمر الرجوع للصفحة السابقة
          },
        ),
        backgroundColor: Appcolor.prim_color,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(color: Appcolor.seco_color, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.error_outline,
              color: Appcolor.seco_color,
              size: 20,
            ),
          ),
        ],
      ),
      body: Serach_widget(),
    );
  }
}


