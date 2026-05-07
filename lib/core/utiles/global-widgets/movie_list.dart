import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/detailes/presentation/screens/detailes_screen.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 15,),
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        var movie = widget.movies[index];
        return Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen(movie: movie,)));
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      height: 160,
                      width: 140,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => SizedBox(
                        height: 160,
                        width: 140,
                        child: Icon(Icons.error_outline),
                      ),
                    ),
                  ),
                  SizedBox(width: 14,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 175,
                        child: Text(
                          '${movie.title}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                            '${movie.voteAverage.toStringAsPrecision(2)}',
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
                            "Action",
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
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: (){
                  if(moviesBox.containsKey(movie.id)){
                    moviesBox.delete(movie.id);
                  }else{
                    moviesBox.put(movie.id, movie);
                  }
                  setState(() {

                  });
                },
                child: Icon(
                  moviesBox.containsKey(movie.id)
                      ? Icons.remove_circle
                      : Icons.add_circle_outline,
                  color: moviesBox.containsKey(movie.id)
                      ? AppColors.red
                      : AppColors.green,
                ),
              ),
            ),
          ],
        );
      },
    );

  }
}
