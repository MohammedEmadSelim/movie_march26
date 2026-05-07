import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global-widgets/search_widget.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        centerTitle: true,
        backgroundColor: AppColors.navy,
        title: Text("Search",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.error_outline,
              color: AppColors.white,),
          ),
        ],
      ),
      backgroundColor: AppColors.navy,
      body: SearchWidget(),
    );
  }
}
