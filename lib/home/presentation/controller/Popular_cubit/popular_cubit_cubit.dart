import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';
import 'package:movie_app_march26/home/data/modules/Popular_model.dart';

part 'popular_cubit_state.dart';

class PopularCubitCubit extends Cubit<PopularCubitState> {
  PopularCubitCubit() : super(PopularCubitInitial());

  Future<void> getPopularMovies() async {
    emit(PopularCubitLoading());
    try {
      // Simulate fetching popular movies (replace with actual API call)
     Dio dio = Dio();
    var response = await dio.get('https://api.themoviedb.org/3/movie/popular?language=en-US&page=1',
    options: Options(
       headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
        'accept': 'application/json',
      },  
    ));
    var data = PopularResponse.fromJson(response.data);
      List<MovieModel> movies = data.results;
      emit(PopularCubitSuccess(movies: movies));
    } catch (e) {
      emit(PopularCubitFailure(errorMessage: e.toString()));
    }
  }
}
