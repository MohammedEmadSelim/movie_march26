import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  final TextEditingController? controller;

  final bool? readOnly;

  final void Function()? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: AppColors.grey,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        hintText: "Search",

        hintStyle: TextStyle(color: AppColors.grey2, fontSize: 18),
        suffixIcon: Icon(Icons.search, color: AppColors.grey2, size: 31),
      ),
      style: TextStyle(color: Colors.white),
      readOnly: readOnly!,
      onTap: onTap,
    );
  }
}
