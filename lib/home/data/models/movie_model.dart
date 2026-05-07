import 'package:hive_flutter/adapters.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String? backdropPath;
  @HiveField(2)
  final List<int> genreIds;
  @HiveField(3)
  final int id;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final String originalLanguage;
  @HiveField(6)
  final String originalTitle;
  @HiveField(7)
  final String overview;
  @HiveField(8)
  final double popularity;
  @HiveField(9)
  final String? posterPath;
  @HiveField(10)
  final String releaseDate;
  @HiveField(11)
  final bool softcore;
  @HiveField(12)
  final bool video;
  @HiveField(13)
  final double voteAverage;
  @HiveField(14)
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