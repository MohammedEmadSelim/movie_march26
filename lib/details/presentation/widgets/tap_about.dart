
import 'package:flutter/material.dart';


class tap_about extends StatelessWidget {
  const tap_about({
    super.key, required this.about,
   
  });

  final String about;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        overflow: TextOverflow.ellipsis,
        maxLines:10,
        '${about}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
