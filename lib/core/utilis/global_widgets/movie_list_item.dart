import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key, required this.movies});
  final List<MovieModel> movies;

  @override
  State<MovieListView> createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        var movie = widget.movies[index];
        return Row(
          children: [
            SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: 95,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 215,
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis ,
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight(400),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_border, color: AppColors.orange, size: 16),
                    SizedBox(width: 8),
                    Text(
                      movie.voteAverage.toString(),
                      style: TextStyle(color: AppColors.orange, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.confirmation_num_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'action',
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      movie.releaseDate,
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.access_time, color: AppColors.white, size: 16),
                    SizedBox(width: 8),
                    Text(
                      '139 Minuets',
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.add_circle, color: AppColors.green),
            ),
            SizedBox(width: 10),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10,),
      itemCount: widget.movies.length,

    );
  }
}
