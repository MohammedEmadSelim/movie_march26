import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global_widgets/search_widget.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/up_coming_cubit/up_coming_cubit.dart';
import 'package:movie_app_march26/home/presentations/screens/home_screen.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';
import 'package:movie_app_march26/search/presentation/ui_screens/search_screen.dart';

class CustomMovieList extends StatefulWidget {
  const CustomMovieList({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<CustomMovieList> createState() => _CustomMovieListState();
}

class _CustomMovieListState extends State<CustomMovieList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 18),
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        var movie = widget.movies[index];
        return Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                    height: 210,
                    width: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                      height: 210,
                      width: 150,
                      child: Icon(Icons.error_outline),
                    ),
                  ),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        '${movie.title}',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Icon(
                          Icons.star_border,
                          color: AppColors.orange,
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '${movie.voteAverage}',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.confirmation_number_outlined,
                          color: AppColors.white,
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'action',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: AppColors.white,
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '${movie.releaseDate}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.white,
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '139 minutes',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  if (moviesBox.containsKey(movie.id)) {
                    moviesBox.delete(movie.id);
                  } else {
                    moviesBox.put(movie.id, movie);
                  }
                  setState(() {});
                },
                child: Icon(
                  moviesBox.containsKey(movie.id)
                      ? Icons.remove_circle
                      : Icons.add_circle_outline,
                  color: moviesBox.containsKey(movie.id)
                      ? AppColors.red:
                  AppColors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}