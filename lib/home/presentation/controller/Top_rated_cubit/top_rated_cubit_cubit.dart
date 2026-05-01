import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';
import 'package:movie_app_march26/home/data/modules/Top_rated_model.dart';

part 'top_rated_cubit_state.dart';

class TopRatedCubitCubit extends Cubit<TopRatedCubitState> {
  TopRatedCubitCubit() : super(TopRatedCubitInitial());

  Future<void> getTopRatedMovies() async {
    emit(TopRatedCubitLoading());
    Dio dio = Dio();
    emit(TopRatedCubitLoading());
    try {
     var response = await dio.get('https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1',options: Options(
       headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
        'accept': 'application/json',
      },
     )) ;
     var data = TopRatedModel.fromJson(response.data);
      emit(TopRatedCubitSuccess(movies: data.results));
    } catch (e) {
      emit(TopRatedCubitFailure(errorMessage: e.toString()));
    }
  }
}
