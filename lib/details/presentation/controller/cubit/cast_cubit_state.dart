part of 'cast_cubit_cubit.dart';

@immutable
sealed class CastCubitState {}

final class CastCubitInitial extends CastCubitState {}
final class CatsCubitLoading extends CastCubitState {}
final class CastCubitSuccess extends CastCubitState {
  final List<Cast> castses;
  CastCubitSuccess(this.castses);
}
final class CastCubitFailure extends CastCubitState {
 final String error;
  CastCubitFailure(this.error);
}

