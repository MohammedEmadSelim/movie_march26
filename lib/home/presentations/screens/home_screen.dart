import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/detailes/presentation/screens/detailes_screen.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/nowPlaying/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/popular/popular_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/topRated/top_rated_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/upComing/up_coming_cubit.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controller/search/search_cubit.dart';
import 'package:movie_app_march26/search/presentation/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What do you want to watch?",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            CustomTextForm(
              readOnly: true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider(
  create: (context) => SearchCubit(),
  child: SearchScreen(),
)));
              },
            ),
            SizedBox(height: 36),
            BlocBuilder<CarouselCubit, CarouselState>(
              builder: (context, state) {
                print("state==========>$state");
                if (state is CarouselLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is CarouselSuccess) {
                  var data = state.movies;
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlayCurve: Curves.bounceOut,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      autoPlay: true,
                      viewportFraction: 0.5,
                    ),
                    itemCount: data.length,
                    itemBuilder:
                        (BuildContext context,
                        int itemIndex,
                        int pageViewIndex,) =>
                        GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${data[itemIndex]
                                  .posterPath}",
                              height: 250,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: (){
                            print(data[itemIndex].id);
                            var movie = data[itemIndex];
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen(movie: movie,)));
                          },
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
                return Center(child: Text(
                    "some unexpected has been happened", style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                )));
              },
            ),
            SizedBox(height: 36),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // indicatorColor: AppColors.white,
              dividerHeight: 0,
              tabs: [
                Tab(
                  child: Text(
                    "Now Playing",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Up Coming",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Top Rated",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<NowPlayingCubit, NowPlayingState>(
                    builder: (context, state) {
                      print("state==========>$state");
                      if (state is NowPlayingLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is NowPlayingSuccess) {
                        var data = state.movies;
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                          ),
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${data[index]
                                        .posterPath}",
                                    height: 250,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: (){
                                  print(data[index].id);
                                  var movie = data[index];
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen(movie: movie,)));
                                },
                              ),
                          itemCount: data.length,
                        );
                      }
                      if (state is NowPlayingFailed) {
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
                      return Center(child: Text(
                          "some unexpected has been happened", style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      )));

                    },
                  ),
                  BlocBuilder<UpComingCubit, UpComingState>(
                    builder: (context, state) {
                      print("state==========>$state");
                      if (state is UpComingLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is UpComingSuccess) {
                        var data = state.movies;
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                          ),
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${data[index]
                                        .posterPath}",
                                    height: 250,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: (){
                                  print(data[index].id);
                                  var movie = data[index];
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen(movie: movie,)));
                                },
                              ),
                          itemCount: data.length,
                        );
                      }
                      if (state is UpComingFailed) {
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
                      return Center(child: Text(
                          "some unexpected has been happened", style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      )));

                    },
                  ),
                  BlocBuilder<TopRatedCubit, TopRatedState>(
                    builder: (context, state) {
                      print("state==========>$state");
                      if (state is TopRatedLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is TopRatedSuccess) {
                        var data = state.movies;
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                          ),
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${data[index]
                                        .posterPath}",
                                    height: 250,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: (){
                                  print(data[index].id);
                                  var movie = data[index];
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen(movie: movie,)));
                                },
                              ),
                          itemCount: data.length,
                        );
                      }
                      if (state is TopRatedFailed) {
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
                      return Center(child: Text(
                          "some unexpected has been happened", style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      )));

                    },
                  ),
                  BlocBuilder<PopularCubit, PopularState>(
                    builder: (context, state) {
                      print("state==========>$state");
                      if (state is PopularLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is PopularSuccess) {
                        var data = state.movies;
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 2 / 3,
                          ),
                          itemBuilder: (context, index) =>
                              GestureDetector(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${data[index]
                                        .posterPath}",
                                    height: 250,
                                    width: 180,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onTap: (){
                                  print(data[index].id);
                                  var movie = data[index];
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailesScreen(movie: movie,)));
                                },
                              ),
                          itemCount: data.length,
                        );
                      }
                      if (state is PopularFailed) {
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
                      return Center(child: Text(
                          "some unexpected has been happened", style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      )));

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
