

import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class NowPlayingMovieModel {
  final MovieDates dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  NowPlayingMovieModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingMovieModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingMovieModel(
      dates: MovieDates.fromJson(json['dates'] ?? {}),
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>? ?? [])
          .map((item) => MovieModel.fromJson(item))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

}

class MovieDates {
  final String maximum;
  final String minimum;

  MovieDates({
    required this.maximum,
    required this.minimum,
  });

  factory MovieDates.fromJson(Map<String, dynamic> json) {
    return MovieDates(
      maximum: json['maximum'] ?? '',
      minimum: json['minimum'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maximum': maximum,
      'minimum': minimum,
    };
  }
}

