import 'package:movie_app_march26/home/data/models/carousel_movie_model.dart';

class TopRatedMoviesResponse {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  TopRatedMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedMoviesResponse.fromJson(Map<String, dynamic> json) {
    return TopRatedMoviesResponse(
      page: json['page'],
      results: (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

