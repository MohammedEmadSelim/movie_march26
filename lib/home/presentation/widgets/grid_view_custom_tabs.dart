
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/widgets/custom_image_network.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class grid_view_custom_tabs extends StatelessWidget {
  const grid_view_custom_tabs({super.key, required this.data});

  final List<MovieModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Custom_image_network(data: data, index: index, height: 220, width: 250,fit: BoxFit.cover,),
       
        );
      },
    );
  }
}