import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/details_screen/presentation/screens/details_scren.dart';
import 'package:movie_app_march26/home/data/models/carousel_movie_model.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/up_coming_cubit/up_coming_cubit.dart';
import 'package:movie_app_march26/home/presentations/widgets/custom_movies_grid.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';
import 'package:movie_app_march26/search/presentation/ui_screens/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> imageUrls = [
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
  ];

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
              onTap: () async{
                print("tapped");

                SharedPreferences pref = await SharedPreferences.getInstance();
                List data = [];
                data.add(pref.get("key"));
                data.add(pref.get("id"));
                data.add(pref.get("name"));
                data.add(pref.get("is_login"));
                data.add(pref.get("score"));
                print(data);
                // Navigator.push(context, MaterialPageRoute(builder: (context) =>
                //     BlocProvider(
                //       create: (context) => SearchCubit(),
                //       child: SearchScreen(),
                //     ),));
              },
            ),
            SizedBox(height: 36),
            // SizedBox(
            //   height: 300,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) => SizedBox(width: 18),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: imageUrls.length,
            //     itemBuilder: (context, index) => ClipRRect(
            //       borderRadius: BorderRadius.circular(16),
            //       child: Image.network(
            //         imageUrls[index],
            //         height: 250,
            //         width: 180,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
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
                    itemCount: imageUrls.length,
                    itemBuilder:
                        (BuildContext context,
                        int itemIndex,
                        int pageViewIndex,) =>
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(movie:data[itemIndex] ,),));
                          },
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
                    "some unexpected has been happened",
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
                      print("object ?????$state");

                      if (state is NowPlayingLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is NowPlayingSuccess) {
                        var data = state.movies;
                        return CustomMoviesGrid(
                          data: data,);
                      }

                      if (state is NowPlayingFailure) {
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
                          "some unexpected has been happened",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
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
                        return CustomMoviesGrid(data: data,);
                      }

                      if (state is UpComingFailure) {
                        return Center(child: Text(state.message,
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),),);
                      }
                      return Center(
                        child: Text(
                          "some unexpected has been happened",
                          style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),

                  Container(
                    child: Center(
                      child: Text(
                        "top rated ",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "popular ",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
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


