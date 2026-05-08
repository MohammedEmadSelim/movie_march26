import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global_widgets/movie_list.dart';
import 'package:movie_app_march26/core/utiles/global_widgets/search_widget.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/up_coming_cubit/up_coming_cubit.dart';
import 'package:movie_app_march26/home/presentations/screens/home_screen.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';
import 'package:movie_app_march26/search/presentation/ui_screens/search_screen.dart';
import 'package:movie_app_march26/watchlist/presentation/screens/watchlist_screen.dart';

import '../../../core/utlies/global_widgets/movie_list.dart';

class WatchList extends StatelessWidget {
  const WatchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return CustomMovieList(movies: moviesBox.values.toList());
  }
}