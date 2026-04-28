part of 'carosel_cubit.dart';

@immutable
sealed class CaroselState {}

final class CaroselInitial extends CaroselState {}
final class CaroselLoading extends CaroselState {}
final class CaroselSuccess extends CaroselState {
  final List<MovieModel> movies ;
  CaroselSuccess({required this.movies});
}
final class CaroselFailure extends CaroselState {
  final String message ;
  CaroselFailure( this.message);

}
