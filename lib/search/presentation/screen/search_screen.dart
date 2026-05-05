import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/core/utilis/global_widgets/search_widget.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      appBar: AppBar(backgroundColor: AppColors.navy),
      body: SearchWidget(),
    );
  }
}




