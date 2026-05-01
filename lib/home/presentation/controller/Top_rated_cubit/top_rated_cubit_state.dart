part of 'top_rated_cubit_cubit.dart';

@immutable
sealed class TopRatedCubitState {}

final class TopRatedCubitInitial extends TopRatedCubitState {}
final class TopRatedCubitLoading extends TopRatedCubitState {}
final class TopRatedCubitSuccess extends TopRatedCubitState {
  final List<MovieModel> movies;
  TopRatedCubitSuccess({required this.movies});
}
final class TopRatedCubitFailure extends TopRatedCubitState {
  final String errorMessage;
  TopRatedCubitFailure({required this.errorMessage});
}
