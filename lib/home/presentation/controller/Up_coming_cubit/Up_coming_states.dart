import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

abstract class UpComingStates {}
class UpComingInitial extends UpComingStates {}
class UpComingLoading extends UpComingStates {} 
class UpComingSuccess extends UpComingStates {
  final List<MovieModel> results;
  UpComingSuccess(this.results);
}
class UpComingFailure extends UpComingStates{
    final String message;

  UpComingFailure({required this.message});
}