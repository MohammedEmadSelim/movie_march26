import 'package:flutter/material.dart';
import 'package:movie_app_march26/Search/presentation/widgets/custom_row_serachpage.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class Card_movie extends StatelessWidget {
  const Card_movie({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
            height: 120,
            width: 95,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => SizedBox(
              height: 120,
              width: 95,
              child: Icon(Icons.error_outline),
            ),
          ),
        ),
        SizedBox(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 195,
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Appcolor.seco_color),
              ),
            ),
            SizedBox(height: 3),
            custom_row_serach_page(
              text: movie.voteAverage.toString().substring(0,3),
              color: Appcolor.six_color,
              iconData: Icons.star_border,
            ),
            custom_row_serach_page(
              text: 'Action',
              iconData: Icons.confirmation_number_outlined,
            ),
            custom_row_serach_page(
              text: movie.releaseDate.substring(0,3) ?? '0.5',
              iconData: Icons.calendar_today_outlined,
            ),
            custom_row_serach_page(
              text: '${movie.voteCount+10} minutes',
              iconData: Icons.access_time,
            ),
          ],
        ),
      ],
    );
  }
}
