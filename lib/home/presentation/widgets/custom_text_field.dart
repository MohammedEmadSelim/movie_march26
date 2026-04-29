import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class custom_text_field extends StatelessWidget {
  const custom_text_field({
    super.key, required this.text, required this.iconData, this.read_only = false, this.on_tap,
  });
final String text;
final IconData iconData;
final bool? read_only;
final Function()? on_tap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: read_only!,
      onTap: on_tap,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Appcolor.thir_color,
        hint: Text(text,style:  TextStyle(color: Appcolor.fort_color,fontSize: 16)),
        suffixIcon: Icon(iconData,size: 29,color: Appcolor.fort_color,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}