
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/widgets/loading_circler.dart';
import 'package:movie_app_march26/details/data/models/ReviewResponseModel%20.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/review_det_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/widgets/ReviewCard.dart';

class tap_review extends StatelessWidget {
  const tap_review({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewDetCubitCubit, ReviewDetCubitState>(
      builder: (context, state) {
        if (state is ReviewDetCubitLoading) {
          return loading_circler();
        } else if (state is ReviewDetCubitSuccess) {
          List<ReviewModel> reviews = state.reviews;
          if (reviews.isEmpty) {
            return const Center(
              child: Text(
                'No reviews found.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          // تم حذف الـ SingleChildScrollView والـ Column والـ Expanded الزيادة
          return ListView.separated(
            itemCount: reviews.length,
            separatorBuilder: (context, index) => SizedBox(height: 15),
            itemBuilder: (context, index) => ReviewCard(
              image:reviews[index].authorDetails.avatarPath ,
              authorName: reviews[index].author,
              content: reviews[index].content,
              rating:
                  reviews[index].authorDetails.rating
                      ?.toDouble() ??
                  0.0,
            ),
          );
        } else if (state is ReviewDetCubitFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
