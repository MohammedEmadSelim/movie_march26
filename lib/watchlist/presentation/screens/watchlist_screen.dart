import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global-widgets/movie_list.dart';

class WatchlistScreen extends StatelessWidget {
   WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: moviesBox.listenable(),
      builder: (context, box , child){
        final movies = moviesBox.values.toList();

        if(movies.isEmpty){
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/magic-box 1.png"),
                SizedBox(height: 5,),
                Center(
                  child: Text("There is no movie yet!",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return MovieList(movies: movies);
      },
    );
  }
}
