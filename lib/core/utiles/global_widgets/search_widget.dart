import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          CustomTextForm(
            onChanged: (value) {
              context.read<SearchCubit>().search(value);
            },
          ),
          SizedBox(height: 24),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if(state is SearchLoading)
              {
                return Center(child: CircularProgressIndicator(),);
              }
              if(state is SearchSuccess){


                var movies = state.movies;
                if(movies.isEmpty)
                {
                  return Lottie.asset("assets/animations/Empty Box.json");

                }
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 18),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                              height: 210,
                              width: 150,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => SizedBox(
                                height: 210,
                                width: 150,
                                child: Icon(Icons.error_outline),
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width:100,
                                child: Text(
                                  '${movie.title}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                  maxLines: 1,
                                ),

                              ),
                              SizedBox(height: 18),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_border,
                                    color: AppColors.orange,
                                    size: 18,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    '${movie.voteAverage}',
                                    style: TextStyle(
                                      color: AppColors.orange,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.confirmation_number_outlined,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'action',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    '${movie.releaseDate}',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    '139 minutes',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              }

              return Lottie.asset("assets/animations/Empty Box.json");
            },
          ),
        ],
      ),
    );
  }
}