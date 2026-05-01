

import 'movie_model.dart';

class CarouselMovieResponseModel {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  CarouselMovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory CarouselMovieResponseModel.fromJson(Map<String, dynamic> json) {
    return CarouselMovieResponseModel(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((item) => MovieModel.fromJson(item))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }


}
