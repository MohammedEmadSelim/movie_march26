import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search,color: AppColors.gray2,size: 32,),
        border: OutlineInputBorder(borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize:14 ,
          fontWeight: FontWeight(400),
          color: AppColors.gray2,
        ),
        filled: true,
        fillColor:AppColors.gray,

      ),
    );
  }
}