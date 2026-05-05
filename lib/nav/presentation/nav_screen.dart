import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/details/presentation/screens/details_screen.dart';
import 'package:movie_app_march26/home/presentation/controllers/carosel_cubit.dart';
import 'package:movie_app_march26/home/presentation/controllers/up_coming_cubit/up_coming_cubit.dart';
import 'package:movie_app_march26/home/presentation/screens/home_screen.dart';
import 'package:movie_app_march26/search/presentation/controller/search_cubit.dart';
import 'package:movie_app_march26/search/presentation/screen/search_screen.dart';
import 'package:movie_app_march26/watch_list/presentation/screen/watch_list_screen.dart';
import '../../home/presentation/controllers/now_playing_cubit/now_playing_cubit.dart';
import '../../home/presentation/controllers/popular_cubit/popular_cubit.dart';
import '../../home/presentation/controllers/top_rated_cubit/top_rated_cubit.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          CarouselCubit()
            ..getCarouselMovie(),
        ),
        BlocProvider(
          create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
        ),
        BlocProvider(
          create: (context) => UpComingCubit()..getUpComingMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatedCubit()..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => PopularCubit()..getPopularMovies(),
        ),
      ],
      child: HomeScreen(),
    ),
    BlocProvider(
  create: (context) => SearchCubit(),
  child: SearchScreen(),
),
    // DetailsScreen(),
    WatchListScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navy,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.gray,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watch list',
          ),
        ],
      ),
    );
  }
}


