import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class custom_text_field extends StatelessWidget {
  const custom_text_field({
    super.key,
    required this.text,
    required this.iconData,
    this.read_only = false,
    this.on_tap,
    this.on_change,
    this.controller, // أضفنا الـ controller هنا
    this.on_clear,   // أضفنا callback لمسح النص
  });

  final String text;
  final IconData iconData;
  final bool? read_only;
  final Function()? on_tap;
  final Function(String)? on_change;
  final TextEditingController? controller; // لتتبع ومسح النص
  final VoidCallback? on_clear;            // لتنفيذ الأكشن عند الضغط على زر الحذف

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // ربط الـ controller
      readOnly: read_only!,
      onTap: on_tap,
      onChanged: on_change,
      style: TextStyle(color: Appcolor.fort_color, fontSize: 16),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Appcolor.thir_color,
        hintText: text, // استخدام hintText بدلاً من hint
        hintStyle: TextStyle(color: Appcolor.fort_color.withOpacity(0.6), fontSize: 16),
        
        // الأيقونة الجانبية (Suffix Icon)
        suffixIcon: controller != null && controller!.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, size: 24),
                color: Appcolor.fort_color,
                onPressed: () {
                  controller!.clear(); // مسح النص من الحقل
                  if (on_clear != null) on_clear!(); // إرجاع الـ State للـ Initial
                },
              )
            : Icon(
                iconData,
                size: 29,
                color: Appcolor.fort_color,
              ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:movie_app_march26/core/theme/AppColor.dart';

// class custom_text_field extends StatelessWidget {
//   const custom_text_field({
//     super.key, required this.text, required this.iconData, this.read_only = false, this.on_tap, this.on_change,
//   });
// final String text;
// final IconData iconData;
// final bool? read_only;
// final Function()? on_tap;
// final Function(String)? on_change;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       readOnly: read_only!,
//       onTap: on_tap,
//       onChanged: on_change,
//        style: TextStyle(color: Appcolor.fort_color,fontSize: 16),
//       decoration: InputDecoration(
//         isDense: true,
//         filled: true,
//         fillColor: Appcolor.thir_color,
//         hint: Text(text,style:  TextStyle(color: Appcolor.fort_color,fontSize: 16)),
//         suffixIcon: Icon(iconData,size: 29,color: Appcolor.fort_color,),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(18),
//           borderSide: BorderSide.none
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(18),
//           borderSide: BorderSide.none
//         )
//       ),
//     );
//   }
// }