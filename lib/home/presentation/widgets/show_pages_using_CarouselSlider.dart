import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class show_pages_using_CarouselSlider extends StatelessWidget {
  const show_pages_using_CarouselSlider({
    super.key,
    required this.data,
  });

  final List<MovieModel> data;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
       // height: 200,
        // autoPlayCurve: Curves.bounceOut,
        //autoPlayAnimationDuration: const Duration(seconds: 3),
        //enlargeCenterPage: true,
        autoPlay: false,
        enableInfiniteScroll: false,
    
        // viewportFraction: 0.6,
      ),
      itemCount: data.length,
      itemBuilder:
          (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${data[itemIndex].posterPath}",
                  height: 200,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Stack(
                  children: [
                    // النص ذو الحدود (Outline)
                    Text(
                      '${(itemIndex + 1)}',
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
                      '${(itemIndex + 1)}',
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
    );
  }
}
