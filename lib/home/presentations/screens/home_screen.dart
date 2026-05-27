import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/details_screen/presentation/screens/details_scren.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/popular_cubit/popular_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/top_rated_cubit/top_rated_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/up_coming_cubit/up_coming_cubit.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import '../../../core/theme/appcolors.dart';
import '../../../details_screen/presentation/screens/details_scren.dart';
import '../controller/carousel_cubit.dart';
import '../controller/now_playing_cubit/now_playing_cubit.dart';
import '../controller/popular_cubit/popular_cubit.dart';
import '../controller/top_rated_cubit/top_rated_cubit.dart';
import '../controller/up_coming_cubit/up_coming_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight(600),
                ),
              ),
              SizedBox(height: 30),
              CustomTextForm(

                readOnly: true,
              ),
              SizedBox(height: 30),
              BlocBuilder<CarouselCubit, CarouselState>(
                builder: (context, state) {
                  if (state is CarouselLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CarouselSuccess) {
                    var data = state.movies;
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlayCurve: Curves.decelerate,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        autoPlay: true,
                        viewportFraction: 0.5,
                      ),
                      itemCount: data.length,
                      itemBuilder:
                          (
                          BuildContext context,
                          int itemIndex,
                          int pageViewIndex,
                          ) => GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie:data[itemIndex] ,),));

                        },
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${data[itemIndex].posterPath}',
                            height: 250,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is CarouselFailure) {
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
                  return Center(
                    child: Text(
                      'Un Expected error... please try again',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 36),
              TabBar(
                dividerHeight: 0,
                indicatorColor: AppColors.white,
                labelColor: AppColors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      'Now Playing',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Up Coming',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Top Rated',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Popular',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<NowPlayingCubit, NowPlayingState>(
                      builder: (context, state) {
                        if (state is NowPlayingLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is NowPlayingSuccess) {
                          var data = state.movies;
                          return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                            itemCount: data.length,
                            padding: EdgeInsets.only(top: 8),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie:data[index] ,),));

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                        if (state is NowPlayingFailure) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 34,
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            'Unexpected Error please try again',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 34,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<UpComingCubit, UpComingState>(
                      builder: (context, state) {
                        if (state is UpComingLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is UpComingSuccess) {
                          var data = state.movies;
                          return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                            itemCount: data.length,
                            padding: EdgeInsets.only(top: 8),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie:data[index] ,),));

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                        if (state is UpComingFailure) {
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 34,
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            'Un Expected Error......... Please try again',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 34,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<TopRatedCubit, TopRatedState>(
                      builder: (context, state) {
                        if (state is TopRatedLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is TopRatedSuccess) {
                          var data = state.movies;
                          return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                            itemCount: data.length,
                            padding: EdgeInsets.only(top: 8),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie:data[index] ,),));

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                        if (state is TopRatedFailure) {
                          return Center(
                            child: Text(
                              state!.message,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 34,
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            'Un Expected Error......... Please try again',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 34,
                            ),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<PopularCubit, PopularState>(
                      builder: (context, state) {
                        if (state is PopularLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is PopularSuccess) {
                          var data = state.movies;
                          return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2 / 3,
                            ),
                            itemCount: data.length,
                            padding: EdgeInsets.only(top: 8),
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie:data[index] ,),));

                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${data[index].posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }
                        if(state is PopularFailure){
                          return Center(
                            child: Text(
                              state.message,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 34,
                              ),
                            ),
                          );
                        }
                        return Center(
                          child: Text(
                            'UnExpected Error ....... please try again later',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 34,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}