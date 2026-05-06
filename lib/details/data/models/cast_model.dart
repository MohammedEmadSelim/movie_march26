class MovieCredits {
  final int id;
  final List<Cast> cast;


  MovieCredits({
    required this.id,
    required this.cast,
  
  });

  factory MovieCredits.fromJson(Map<String, dynamic> json) {
    return MovieCredits(
      id: json['id'] ?? 0,
      cast: (json['cast'] as List?)
              ?.map((item) => Cast.fromJson(item))
              .toList() ?? [],
    
    );
  }
}
class Cast {
  final int id;
  final String name;
  final String character;
  final String? profilePath;
  final double popularity;
  final int order;

  Cast({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
    required this.popularity,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      profilePath: json['profile_path'],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      order: json['order'] ?? 0,
    );
  }
}