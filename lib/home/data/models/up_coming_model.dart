import 'package:movie_app_march26/home/data/models/movie_model.dart';

class UpComingMovieModel {
  final Dates dates;
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  UpComingMovieModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpComingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpComingMovieModel(
      dates: Dates.fromJson(json['dates']),
      page: json['page'],
      results: (json['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Dates {
  final String maximum;
  final String minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }
}
