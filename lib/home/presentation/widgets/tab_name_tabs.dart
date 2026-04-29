
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class tab_name_tabs extends StatelessWidget {
  const tab_name_tabs({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(text,style: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: Appcolor.seco_color,
      fontSize: 14
    ),),);
  }
}