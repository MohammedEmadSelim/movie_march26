
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app_march26/core/theme/appcolors.dart';
// import 'package:movie_app_march26/home/data/models/carousel_movie_model.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
// import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
// import 'package:movie_app_march26/home/presentations/controller/now_playing_cubit/now_playing_cubit.dart';
// import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';

class CustomMoviesGrid extends StatelessWidget {
  const CustomMoviesGrid({
    super.key,
    required this.data,

  });

  final List<MovieModel> data;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          "https://image.tmdb.org/t/p/w500${data[index].posterPath}",
          height: 250,
          width: 180,
          fit: BoxFit.cover,
        ),
      ),
      itemCount: data.length,
    );
  }
}