import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/home/data/modules/upcoming_model.dart';
import 'package:movie_app_march26/home/presentation/controller/Up_coming_cubit/Up_coming_states.dart';

class UpComingCubit extends Cubit<UpComingStates> {
  UpComingCubit() : super(UpComingInitial());

  Future<void> getUpComingMovies() async {
    emit(UpComingInitial());
    try {
  var dio = Dio();
    Response res = await dio.get(
    'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1',
    options: Options(
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
        'accept': 'application/json',
      },
    ),
  );
     var data = UpcomingModel.fromJson(res.data);
     emit(UpComingSuccess(data.movies));
} catch (e) {
  emit(UpComingFailure(message: e.toString()));
}
   
  }
  // var dio = Dio();
  //   try {
  //     var res = await dio.get(
  //       "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1",
  //       options: Options(
  //         headers: {
  //           "Authorization":
  //           "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
  //           "accept": "application/json",
  //         },
  //       ),
  //     );
  //     var data = NowPlayingMovieModel.fromJson(res.data);

  //     emit(NowPlayingSuccess(data.results));
  //     //success
  //   } catch (e) {
  //     //failure
  //     emit(NowPlayingFailure(e.toString()));
  //   }
  // }
}
