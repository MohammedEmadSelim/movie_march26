import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global_widgets/movie_list.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';

import 'movie_list.dart';

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
                return Expanded(child: CustomMovieList(movies: movies));
              }

              return Lottie.asset("assets/animations/Empty Box.json");
            },
          ),
        ],
      ),
    );
  }
}
