part of 'carousel_cubit.dart';

@immutable
sealed class CarouselState {}

final class CarouselInitial extends CarouselState {}
final class CarouselLoading extends CarouselState {}
final class CarouselSuccess extends CarouselState {


  final List<MovieModel> movies;

  CarouselSuccess({required this.movies});

}
final class CarouselFailure extends CarouselState {
  final String message;

  CarouselFailure(this.message);
}