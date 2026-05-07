part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}
final class MoviesReviewsLoading extends ReviewsState {}
final class MoviesReviewsSuccess extends ReviewsState {
  final ReviewsModel movie;

  MoviesReviewsSuccess(this.movie);

}
final class MoviesReviewsFailure extends ReviewsState {
  final String message;

  MoviesReviewsFailure({required this.message});
}
