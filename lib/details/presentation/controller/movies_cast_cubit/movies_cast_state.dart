part of 'movies_cast_cubit.dart';

@immutable
sealed class MoviesCastState {}

final class MoviesCastInitial extends MoviesCastState {}
final class MoviesCastLoading extends MoviesCastState {}
final class MoviesCastSuccess extends MoviesCastState {
  final MovieCastModel movie;

  MoviesCastSuccess(this.movie);

}
final class MoviesCastFailure extends MoviesCastState {
  final String message;

  MoviesCastFailure({required this.message});
}