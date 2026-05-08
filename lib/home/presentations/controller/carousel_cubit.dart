import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/models/carousel_movie_model.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselInitial());

  Future<void> getCarouselMovies()async{
    emit(CarouselLoading());
    //loading
    var dio = Dio();

    try{
      var res = await dio.get("https://api.themoviedb.org/3/discover/movie",
          options: Options(
              headers: {
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
                "accept": "application/json"
              }
          ));

      var data =  CarouselMovieResponseModel.fromJson(res.data);
      print(data.results.length);
      // success
      emit(CarouselSuccess(movies: data.results));
      print("the res is $res");
    }catch(e){

      // failure
      emit(CarouselFailure(e.toString()));

      print("this error is ===>$e");
    }
  }
}