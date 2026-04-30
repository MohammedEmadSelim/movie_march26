part of 'up_coming_cubit.dart';

@immutable
sealed class UpComingState {}

final class UpComingInitial extends UpComingState {}
final class UpComingLoading extends UpComingState {}
final class UpComingSuccess extends UpComingState {
  final List<MovieModel>movies;

  UpComingSuccess({required this.movies});
}
final class UpComingFailure extends UpComingState {
  final String message;
  UpComingFailure({required this.message});
}
