import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart'; // ✅ مهم
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_colors.dart';
import '../../../nav/widgets/custom_text_field.dart';
import '../controller/carousel_cubit.dart';
import '../controller/now_playing_cubit/now_playing_cubit.dart';
import '../controller/up_coming_cubit/up_coming_cubit.dart';
import '../widgets/custom_movies_grid.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> imageUrls = [
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
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
              onTap: () {
                print("tapped");
              },
            ),
            SizedBox(height: 36),

            BlocBuilder<CarouselCubit, CarouselState>(
              builder: (context, state) {
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
                    itemCount: data.length, // ✅ FIX هنا
                    itemBuilder: (context, itemIndex, _) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${data[itemIndex].posterPath}",
                        height: 250,
                        width: 180,
                        fit: BoxFit.cover,
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
              dividerHeight: 0,
              tabs: [
                Tab(child: Text("Now Playing", style: TextStyle(color: AppColors.white))),
                Tab(child: Text("Up Coming", style: TextStyle(color: AppColors.white))),
                Tab(child: Text("Top Rated", style: TextStyle(color: AppColors.white))),
                Tab(child: Text("Popular", style: TextStyle(color: AppColors.white))),
              ],
            ),

            SizedBox(height: 24),

            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<NowPlayingCubit, NowPlayingState>(
                    builder: (context, state) {
                      if (state is NowPlayingLoading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (state is NowPlayingSuccess) {
                        return CustomMoviesGrid(data: state.movies);
                      }

                      if (state is NowPlayingFailure) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(color: AppColors.white),
                          ),
                        );
                      }

                      return Center(child: Text("error"));
                    },
                  ),

                  BlocBuilder<UpComingCubit, UpComingState>(
                    builder: (context, state) {
                      if (state is UpComingLoading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (state is UpComingSuccess) {
                        return CustomMoviesGrid(data: state.movies);
                      }

                      if (state is UpComingFailure) {
                        return Center(
                          child: Text(
                            state.message,
                            style: TextStyle(color: AppColors.white),
                          ),
                        );
                      }

                      return Center(child: Text("error"));
                    },
                  ),

                  Center(child: Text("top rated", style: TextStyle(color: AppColors.white))),
                  Center(child: Text("popular", style: TextStyle(color: AppColors.white))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}