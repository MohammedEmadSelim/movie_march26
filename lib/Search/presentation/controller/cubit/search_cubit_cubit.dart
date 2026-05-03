import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/Search/data/modules/SearchModel.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit() : super(SearchCubitInitial());
  
  get_search(String query) async {
    if (query.isEmpty) {
     return clearSearch();
      
    }
    emit(SearchCubitLoading());
    try {
     Dio dio = Dio();
  var respone = await dio.get('https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=1', 
  options: Options(
       headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4',
        'accept': 'application/json',
      },  
    ),);
  var data = SearchModel.fromJson(respone.data);
    emit(SearchCubitSuccess(moveies: data.results)); 
    }catch(e){
      emit(SearchCubitFailure(errorMessage: e.toString()));
    }
  }
  void clearSearch() {
    emit(SearchCubitInitial());
  }
}
