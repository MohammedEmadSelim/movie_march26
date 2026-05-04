part of 'details_cubit_cubit.dart';

@immutable
sealed class DetailsCubitState {}

final class DetailsCubitInitial extends DetailsCubitState {}
final class DetailsCubitLoading extends DetailsCubitState {}
final class DetailsCubitSuccess extends DetailsCubitState {
  final MovieDetailsModel details;
  DetailsCubitSuccess(this.details);
}
final class DetailsCubitFailure extends DetailsCubitState {
 final String error;
  DetailsCubitFailure(this.error);
}