import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/home/data/models/up_coming_model.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit() : super(UpComingInitial());

  Future<void> getUpComingMovies() async {
    //loading
    emit(UpComingLoading());
    var dio = Dio();
    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/top_rated?language=ar&page=1",
        options: Options(
          headers: {
            "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
            "accept": "application/json",
          },
        ),
      );
      var data = UpComingMoviesModel.fromJson(res.data);

      // success
      emit(UpComingSuccess(data.results));

    } catch (e) {

      // failure
      emit(UpComingFailure(e.toString()));

    }
  }
}
