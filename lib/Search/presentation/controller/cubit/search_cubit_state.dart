part of 'search_cubit_cubit.dart';

@immutable
sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}
final class SearchCubitLoading extends SearchCubitState {}
final class SearchCubitSuccess extends SearchCubitState {
  final  List<MovieModel> moveies;
  SearchCubitSuccess({required this.moveies});
}
final class SearchCubitFailure extends SearchCubitState {
  final String errorMessage;
  SearchCubitFailure({required this.errorMessage});
}
