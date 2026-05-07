import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_march26/details/data/models/movie_review_model.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());
  Future<void> getMovieReview(String id) async {
    emit(MoviesReviewsLoading());
    try {
      var dio = Dio();
      var res = await dio.get(
        'https://api.themoviedb.org/3/movie/$id/reviews?language=en-US',
        options: Options(
          headers: {
            "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
            "accept": "application/json",
          },
        ),
      );
      var data = ReviewsModel.fromJson(res.data);
      emit(MoviesReviewsSuccess(data));
    } catch (e) {
      emit(MoviesReviewsFailure( message: e.toString(),));
    }
  }

}
