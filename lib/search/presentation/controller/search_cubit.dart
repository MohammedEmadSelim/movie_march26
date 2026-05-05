import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());


  Future<void>search (String query)async{
    emit(SearchLoading());
    try{
      var dio = Dio();
      var res = await dio.get('https://api.themoviedb.org/3/search/movie?query=$query',
          options: Options(
              headers: {
                'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
                'accept': 'application/json'
              }
          )
      );
      var data = res.data['results'] as List;
      var movies = data.map((e) {
        return MovieModel.fromJson(e as Map<String,dynamic> );
      },).toList();
      emit(SearchSuccess(movies: movies));
    }catch(e){
      emit(SearchFailure(message: e.toString()));
    }
  }
}
