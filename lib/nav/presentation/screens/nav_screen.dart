import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/core/utiles/global-widgets/search_widget.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/nowPlaying/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/popular/popular_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/topRated/top_rated_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/upComing/up_coming_cubit.dart';
import 'package:movie_app_march26/home/presentations/screens/home_screen.dart';
import 'package:movie_app_march26/search/presentation/controller/search/search_cubit.dart';
import 'package:movie_app_march26/watchlist/presentation/screens/watchlist_screen.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => CarouselCubit()..getCarouselMovies()),
        BlocProvider( create: (context) => NowPlayingCubit()..NowPlayingMovies()),
        BlocProvider( create: (context) => UpComingCubit()..UpComingMovies()),
        BlocProvider( create: (context) => TopRatedCubit()..TopRatedMovies()),
        BlocProvider( create: (context) => PopularCubit()..PopularMovies()),
      ],
      child: HomeScreen(),
    ),
    BlocProvider(
        create: (context) => SearchCubit(),
        child: SearchWidget(),
    ),
    WatchlistScreen(),
  ];


  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        centerTitle: true,
        leading: currentIndex == 1 || currentIndex == 2
            ? IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
        )
            : null,
        iconTheme: IconThemeData(color: AppColors.white),
        title: currentIndex == 1 || currentIndex == 2 ?
        Text(currentIndex == 1 ? "Search" : "Watch List" ,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),): null,
        actions: currentIndex == 1 ?[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.error_outline,
              color: AppColors.white,),
          ),
        ]: null,
      ),
      backgroundColor: AppColors.navy,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.navy,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grey2,
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "home",),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search",),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), label: "watch list",)
          ]),
    );
  }
}



