
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/core/theme/widgets/custom_image_network.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class show_pages_using_sizedbox extends StatelessWidget {
  const show_pages_using_sizedbox({
    super.key,
    required this.data,
  });

  final List<MovieModel> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                // 220 h 
                // 150 w
                child: Custom_image_network(data: data,index : index, height: 220, width:150),     ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Stack(
                  children: [
                    // النص ذو الحدود (Outline)
                    Text(
                      '${(index + 1)}',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Appcolor.fiv_color,
                      ),
                    ),
                    // النص الداخلي
                    Text(
                      '${(index + 1)}',
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff242A32),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
