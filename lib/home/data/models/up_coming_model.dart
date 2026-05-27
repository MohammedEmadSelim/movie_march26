

import 'package:movie_app_march26/home/data/models/movie_model.dart';

class UpComingMoviesModel {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  UpComingMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpComingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpComingMoviesModel(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((item) => MovieModel.fromJson(item))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }


}
