import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/home/data/models/top_rated_model.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial());

  Future<void>getTopRatedMovies()async{
    emit(TopRatedLoading());
    try{
      var dio = Dio();
      var res = await dio.get('https://api.themoviedb.org/3/movie/top_rated',
          options: Options(
              headers: {
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
                'accept': 'application/json'
              }
          ));

      var data = TopRatedMovieModel.fromJson(res.data);
      emit(TopRatedSuccess(data.results));
    }catch(e){
      emit(TopRatedFailure(e.toString()));
    }
  }
}
