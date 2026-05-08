import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global_widgets/search_widget.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';

import '../../../core/utlies/global_widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        iconTheme: IconThemeData(color: AppColors.white),
        title: Text(
          "Search",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Icon(Icons.error_outline, color: AppColors.white, size: 26),
          ),
        ],
      ),
      body: SearchWidget(),
    );
  }
}

