import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global-widgets/movie_list.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controller/search/search_cubit.dart';

class SearchWidget extends StatelessWidget {
   SearchWidget({super.key});

   TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CustomTextForm(
            controller: searchController,
            onChanged: (value) {
              if(value.trim().isEmpty){
                context.read<SearchCubit>().ClearSearch();
              }else{
                context.read<SearchCubit>().SearchResults(value);
              }

            },
          ),
          SizedBox(height: 24),
          BlocBuilder<SearchCubit,SearchState>(builder: (context, state)
          {
            if(state is SearchLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is SearchSuccess){
              var movie = state.movies;
              if(movie.isEmpty){
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/no-results 1.png"),
                      SizedBox(height: 5,),
                      Text("we are sorry, we can not find the movie :(",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 5,),
                      Text("Find your movie by Type title",
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              }
              return Expanded(child: MovieList(movies: movie,));
            }
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/no-results 1.png"),
                  SizedBox(height: 9,),
                  Text("Find your movie by Type title",
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
            }
          )
        ],
      ),
    );
  }
}
