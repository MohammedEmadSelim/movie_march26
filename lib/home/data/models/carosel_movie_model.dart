import 'package:movie_app_march26/home/data/models/movie_model.dart';

class CarouselMovieResponseModel  {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  CarouselMovieResponseModel ({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory CarouselMovieResponseModel .fromJson(Map<String, dynamic> json) {
    return CarouselMovieResponseModel (
      page: json['page'],
      results: (json['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}


