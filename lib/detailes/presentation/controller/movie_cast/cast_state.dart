part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastLoading extends CastState {}

final class CastSuccess extends CastState {
  final MovieCastResponse movieCast;

  CastSuccess({required this.movieCast});
}

final class CastFailed extends CastState {
  final String message;

  CastFailed(this.message);
}