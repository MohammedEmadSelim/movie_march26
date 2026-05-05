import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/core/utilis/global_widgets/movie_list_item.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_form_field.dart';
import 'package:movie_app_march26/search/presentation/controller/search_cubit.dart';


class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextFormField(
            onChanged: (value) {
              context.read<SearchCubit>().search(value);
            },
            readOnly: false,
          ),
          SizedBox(height: 20),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if(state is SearchLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              if(state is SearchSuccess){
                var movies = state.movies;
               if(movies.isEmpty){
                  Lottie.asset('assets/animation/6793c5a5-0795-4193-92a3-5f3f6dd10316.json');
               }
                return Expanded(
                  child: MovieListView(movies: movies),
                );
              }

              if(state is SearchFailure){
                return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    );
              }
              return Lottie.asset('assets/animation/6793c5a5-0795-4193-92a3-5f3f6dd10316.json');
            },
          ),
        ],
      ),
    );
  }
}

