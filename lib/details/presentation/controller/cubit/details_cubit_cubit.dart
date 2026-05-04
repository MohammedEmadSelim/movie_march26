import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/details/data/models/Details_movie_model.dart';

part 'details_cubit_state.dart';

class DetailsCubitCubit extends Cubit<DetailsCubitState> {
  DetailsCubitCubit() : super(DetailsCubitInitial());
 get_details(String id) async {
    emit(DetailsCubitLoading());
  
    try {
     var dio = Dio();
    var respone = await  dio.get('https://api.themoviedb.org/3/movie/$id?language=en-US', options: Options(
       headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
        'accept': 'application/json',
      },  
    ),);
    var data = MovieDetailsModel.fromJson(respone.data);

      emit(DetailsCubitSuccess(data));
    } catch (e) {
      emit(DetailsCubitFailure(e.toString()));
    }
  }
}
