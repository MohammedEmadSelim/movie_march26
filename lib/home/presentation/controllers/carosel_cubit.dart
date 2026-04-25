import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'carosel_state.dart';

class CarouselCubit extends Cubit<CaroselState> {

  Future<void>getCarouselMovie()async{
    var dio = Dio();
    try{
      var res = await dio.get('https://api.themoviedb.org/3/discover/movie',
          options: Options(
              headers: {
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
                'accept': 'application/json'
              }
          )
      );
    }catch(e){
      print(e);
    }
  }
  CarouselCubit() : super(CaroselInitial());
}
