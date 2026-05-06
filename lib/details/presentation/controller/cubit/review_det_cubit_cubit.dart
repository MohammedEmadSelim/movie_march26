import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/details/data/models/ReviewResponseModel%20.dart';

part 'review_det_cubit_state.dart';

class ReviewDetCubitCubit extends Cubit<ReviewDetCubitState> {
  ReviewDetCubitCubit() : super(ReviewDetCubitInitial());
  getReviews(String movieId) async {
    emit(ReviewDetCubitLoading());
    try {
     Dio dio = Dio();
   var response = await dio.get('https://api.themoviedb.org/3/movie/$movieId/reviews?language=en-US&page=1', options: Options(
              headers: {
                "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",                "accept": "application/json"
              }
          ));
   var d1  = ReviewResponseModel.fromJson(response.data);
   var res = d1.results;
      emit(ReviewDetCubitSuccess(res));
    } catch (e) {
      emit(ReviewDetCubitFailure('Failed to fetch reviews: $e'));
    }
  }
}
