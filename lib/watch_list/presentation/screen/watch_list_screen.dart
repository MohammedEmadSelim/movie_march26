import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/utils/global_widgets/movie_list_item.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if(moviesBox.isEmpty){
     return Center(child: SvgPicture.asset('assets/images/Empty Wishlist.svg'));
    }else{
      return MovieListView(movies: moviesBox.values.toList());
    }

  }
}