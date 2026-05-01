part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final MovieDetailsModel movieDetails;

  DetailsSuccess({required this.movieDetails});
}

final class DetailsFailed extends DetailsState {
  final String message;

  DetailsFailed(this.message);
}

