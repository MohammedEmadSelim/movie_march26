class MovieCastResponse {
  final int id;
  final List<CastModel> cast;
  final List<CrewModel> crew;

  MovieCastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCastResponse.fromJson(Map<String, dynamic> json) {
    return MovieCastResponse(
      id: json['id'],
      cast: (json['cast'] as List)
          .map((e) => CastModel.fromJson(e))
          .toList(),
      crew: (json['crew'] as List)
          .map((e) => CrewModel.fromJson(e))
          .toList(),
    );
  }
}

class CastModel {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'],
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order'],
    );
  }
}

class CrewModel {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String creditId;
  final String department;
  final String job;

  CrewModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'],
      creditId: json['credit_id'],
      department: json['department'],
      job: json['job'],
    );
  }
}