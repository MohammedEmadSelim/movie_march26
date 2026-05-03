
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class custom_row_serach_page extends StatelessWidget {
  const custom_row_serach_page({
    super.key, required this.text, required this.iconData, this.color = Colors.white
  });
final String text;
final IconData iconData;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(iconData,size: 20,color: color,),
        SizedBox(width: 3,),
        Text(text,style: TextStyle(
        fontSize: 16,
        color: color
      ),),
      ],
    );
  }
}
