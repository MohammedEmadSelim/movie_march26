class MovieReviewsResponse {
  final int id;
  final int page;
  final List<ReviewModel> results;
  final int totalPages;
  final int totalResults;

  MovieReviewsResponse({
    required this.id,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieReviewsResponse.fromJson(Map<String, dynamic> json) {
    return MovieReviewsResponse(
      id: json['id'],
      page: json['page'],
      results: (json['results'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class ReviewModel {
  final String author;
  final AuthorDetailsModel authorDetails;
  final String content;
  final String createdAt;
  final String id;
  final String updatedAt;
  final String url;

  ReviewModel({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'],
      authorDetails: AuthorDetailsModel.fromJson(json['author_details']),
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }
}

class AuthorDetailsModel {
  final String name;
  final String username;
  final String? avatarPath;
  final double? rating;

  AuthorDetailsModel({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailsModel(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating'] == null
          ? null
          : (json['rating'] as num).toDouble(),
    );
  }
}