import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/details/data/models/cast_model.dart';

part 'cast_cubit_state.dart';

class CastCubitCubit extends Cubit<CastCubitState> {
  CastCubitCubit() : super(CastCubitInitial());
  get_details(String id) async {
    emit(CatsCubitLoading());
  
    try {
     var dio = Dio();
    var respone = await  dio.get('https://api.themoviedb.org/3/movie/$id/credits?language=en-US', options: Options(
       headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
        'accept': 'application/json',
      },  
    ),);
    var data = MovieCredits.fromJson(respone.data);

      emit(CastCubitSuccess(data.cast));
    } catch (e) {
      emit(CastCubitFailure(e.toString()));
    }
  }
}
