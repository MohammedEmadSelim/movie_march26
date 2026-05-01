part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final MovieReviewsResponse movieReviews;

  ReviewsSuccess({required this.movieReviews});
}

final class ReviewsFailed extends ReviewsState {
  final String message;

  ReviewsFailed(this.message);
}
