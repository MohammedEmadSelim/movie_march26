import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class UpcomingModel {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<MovieModel> movies;
  final String maxDate;
  final String minDate;

  UpcomingModel({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.movies,
    required this.maxDate,
    required this.minDate,
  });

  factory UpcomingModel.fromJson(Map<String, dynamic> json) {
    return UpcomingModel(
      page: json['page'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
      maxDate: json['dates']?['maximum'] ?? "",
      minDate: json['dates']?['minimum'] ?? "",
      movies: (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
    );
  }
}