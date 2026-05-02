import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/models/carousel_movie_model.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/home/data/models/now_playing_model.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingInitial());

  Future<void> getNowPlaying() async {
    emit(NowPlayingLoading());
    //loading
    var dio = Dio();
    try {
      var res = await dio.get(
        "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1",
        options: Options(
          headers: {
            "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
            "accept": "application/json",
          },
        ),
      );
      var data = NowPlayingMovieModel.fromJson(res.data);

      emit(NowPlayingSuccess(data.results));
      //success
    } catch (e) {
      //failure
      emit(NowPlayingFailure(e.toString()));
    }
  }
}
