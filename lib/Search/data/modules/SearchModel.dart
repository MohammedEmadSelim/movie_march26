import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class SearchModel {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  SearchModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      page: json['page'] ?? 1,
      results: (json['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

 
}