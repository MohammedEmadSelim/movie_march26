import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/models/carousel_movie_model.dart';
import 'package:movie_app_march26/home/data/models/popular_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  Future<void> PopularMovies () async {
    emit(PopularLoading());
    var dio = Dio();
    try{
      var res = await dio.get("https://api.themoviedb.org/3/movie/popular",
        options: Options(
          headers: {
            "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
            "accept" : "application/json",
          },
        ),
      );
      var data = PopularMoviesResponse.fromJson(res.data);
      emit(PopularSuccess(movies: data.results));
    }catch(error){
      emit(PopularFailed(error.toString()));
    }
  }
}
