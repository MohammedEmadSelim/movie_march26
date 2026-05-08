import 'package:hive_flutter/hive_flutter.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0) // Unique ID for the type, typically 0 or greater
class MovieModel extends HiveObject {
  @HiveField(0) // Unique ID for the field
  final bool adult;
  @HiveField(1) // Unique ID for the field
  final String? backdropPath;
  @HiveField(2) // Unique ID for the field
  final List<int> genreIds;
  @HiveField(3) // Unique ID for the field
  final int id;
  @HiveField(4) // Unique ID for the field
  final String title;
  @HiveField(5) // Unique ID for the field
  final String originalLanguage;
  @HiveField(6) // Unique ID for the field
  final String originalTitle;
  @HiveField(7) // Unique ID for the field
  final String overview;
  @HiveField(8) // Unique ID for the field
  final double popularity;
  @HiveField(9) // Unique ID for the field
  final String? posterPath;
  @HiveField(10) // Unique ID for the field
  final String releaseDate;
  @HiveField(11) // Unique ID for the field
  final bool softcore;
  @HiveField(12) // Unique ID for the field
  final bool video;
  @HiveField(13) // Unique ID for the field
  final double voteAverage;
  @HiveField(14) // Unique ID for the field
  final int voteCount;

  MovieModel({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.releaseDate,
    required this.softcore,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] ?? 0).toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
      softcore: json['softcore'] ?? false,
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }
}