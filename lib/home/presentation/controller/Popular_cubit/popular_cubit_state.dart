part of 'popular_cubit_cubit.dart';

@immutable
sealed class PopularCubitState {}

final class PopularCubitInitial extends PopularCubitState {}
final class PopularCubitLoading extends PopularCubitState {}
final class PopularCubitSuccess extends PopularCubitState {
  final List<MovieModel> movies;
  PopularCubitSuccess({required this.movies});
}
final class PopularCubitFailure extends PopularCubitState {       
  final String errorMessage;
  PopularCubitFailure({required this.errorMessage});
}
