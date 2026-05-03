
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/Search/presentation/pages/Search_page.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/core/theme/widgets/loading_circler.dart';

import 'package:movie_app_march26/home/presentation/controller/Carousel_cubit.dart';
import 'package:movie_app_march26/home/presentation/controller/Popular_cubit/popular_cubit_cubit.dart';
import 'package:movie_app_march26/home/presentation/controller/Top_rated_cubit/top_rated_cubit_cubit.dart';
import 'package:movie_app_march26/home/presentation/controller/Up_coming_cubit/Up_coming_cubit.dart';
import 'package:movie_app_march26/home/presentation/controller/Up_coming_cubit/Up_coming_states.dart';
import 'package:movie_app_march26/home/presentation/controller/nowplaying_cubit/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentation/widgets/grid_view_custom_tabs.dart';
import 'package:movie_app_march26/home/presentation/widgets/show_pages_using_CarouselSlider.dart';
import 'package:movie_app_march26/home/presentation/widgets/show_pages_using_sizedbox.dart';

import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/nav/presentation/widgets/tab_name_tabs.dart';

class Homepage extends StatelessWidget {
 const Homepage({super.key});
  // final List<String> imageUrls = [
  //   'https://picsum.photos/id/101/600/400',
  //   'https://picsum.photos/id/102/600/400',
  //   'https://picsum.photos/id/103/600/400',
  //   'https://picsum.photos/id/104/600/400',
  //   'https://picsum.photos/id/101/600/400',
  //   'https://picsum.photos/id/102/600/400',
  //   'https://picsum.photos/id/103/600/400',
  //   'https://picsum.photos/id/104/600/400',
  //   'https://picsum.photos/id/101/600/400',
  //   'https://picsum.photos/id/102/600/400',
  //   'https://picsum.photos/id/103/600/400',
  //   'https://picsum.photos/id/104/600/400',
  //   'https://picsum.photos/id/101/600/400',
  //   'https://picsum.photos/id/102/600/400',
  //   'https://picsum.photos/id/103/600/400',
  //   'https://picsum.photos/id/104/600/400',
  // ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Appcolor.prim_color,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: TextStyle(
                  color: Appcolor.seco_color,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              custom_text_field(text: 'Search', iconData: Icons.search,on_tap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },read_only: true,),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: BlocBuilder<CarouselCubit, CarouselState>(
                  builder: (context, state) {
                    if (state is CarouselLoading) {
                      return loading_circler();
                    } else if (state is CarouselSuccess) {
                      var data = state.movies;
                      return show_pages_using_sizedbox(data: data);
                    } else if (state is CarouselFailure) {
                      return Container(
                              color: Colors.red,
                              child: Text('Error: ${state.toString()}'),
                            );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              // SizedBox(height: 8),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                //indicatorColor: Appcolor.fort_color,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3, color: Appcolor.fort_color),
                ),
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerHeight: 0,
                tabs: [
                  tab_name_tabs(text: 'Now playing'),
                  tab_name_tabs(text: 'Up coming'),
                  tab_name_tabs(text: 'Top rated'),
                  tab_name_tabs(text: 'Popular'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<NowPlayingCubit, NowPlayingState>(
                      builder: (context, state) {
                        if (state is NowPlayingLoading) {
                          return loading_circler();
                        } else if (state is NowPlayingSuccess) {
                          var data = state.movies;
                          return grid_view_custom_tabs(data: data);
                        } else if (state is NowPlayingFailure) {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        } else {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        }
                      },
                    ),
                    BlocBuilder<UpComingCubit, UpComingStates>(
                      builder: (context, state) {
                        if (state is UpComingLoading) {
                          return loading_circler();
                        } else if (state is UpComingSuccess) {
                          var data = state.results;
                          return grid_view_custom_tabs(data: data);
                        } else if (state is UpComingFailure) {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        } else {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        }
                      },
                    ),
                     BlocBuilder<TopRatedCubitCubit, TopRatedCubitState>(
                      builder: (context, state) {
                        if (state is TopRatedCubitLoading) {
                          return loading_circler();
                        } else if (state is TopRatedCubitSuccess) {
                          var data = state.movies;
                          return grid_view_custom_tabs(data: data);
                        } else if (state is TopRatedCubitFailure) {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        } else {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        }
                      },
                    ),
                    BlocBuilder<PopularCubitCubit, PopularCubitState>(
                      builder: (context, state) {
                        if (state is PopularCubitLoading) {
                          return loading_circler();
                        } else if (state is PopularCubitSuccess) {
                          var data = state.movies;
                          return grid_view_custom_tabs(data: data);
                        } else if (state is PopularCubitFailure) {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        } else {
                          return Container(
                            color: Colors.red,
                            child: Text('Error: ${state.toString()}'),
                          );
                        }
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

