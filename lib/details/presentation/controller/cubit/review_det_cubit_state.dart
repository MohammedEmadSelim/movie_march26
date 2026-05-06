part of 'review_det_cubit_cubit.dart';

@immutable
sealed class ReviewDetCubitState {}

final class ReviewDetCubitInitial extends ReviewDetCubitState {}
final class ReviewDetCubitLoading extends ReviewDetCubitState {}
final class ReviewDetCubitSuccess extends ReviewDetCubitState {
  final List<ReviewModel> reviews;    
  ReviewDetCubitSuccess(this.reviews);
}
final class ReviewDetCubitFailure extends ReviewDetCubitState {
  final String errorMessage;
  ReviewDetCubitFailure(this.errorMessage);
}
