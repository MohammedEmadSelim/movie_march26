import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class custom_cast_details extends StatelessWidget {
  const custom_cast_details({
    super.key, required this.name, this.image,
  });
final String name;
final String ? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: image == null ? AssetImage('assets/images/per.png') : NetworkImage('https://image.tmdb.org/t/p/w500$image',),
        ),
        SizedBox(height: 5,),
      Text(name,style: TextStyle(
        color: Appcolor.seco_color,
        fontSize: 15,
      ),)
      ],
    );
  }
}
