


import 'package:flutter/material.dart';

import '../../data/movie_model.dart';

class CustomMoviesGrid extends StatelessWidget {
  const CustomMoviesGrid({
    super.key,
    required this.data,

  });

  final List<MovieModel> data;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          "https://image.tmdb.org/t/p/w500${data[index].posterPath}",
          height: 250,
          width: 180,
          fit: BoxFit.cover,
        ),
      ),
      itemCount: data.length,
    );
  }
}