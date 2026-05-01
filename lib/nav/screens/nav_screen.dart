

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_colors.dart';
import '../../home/presentation/controller/carousel_cubit.dart';
import '../../home/presentation/controller/now_playing_cubit/now_playing_cubit.dart';
import '../../home/presentation/controller/up_coming_cubit/up_coming_cubit.dart';
import '../../home/presentation/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          CarouselCubit()
            ..getCarouselMovies(),
        ),
        BlocProvider(
          create: (context) => NowPlayingCubit()..getNowPlaying(),
        ),
        BlocProvider(
          create: (context) => UpComingCubit()..getUpComingMovies(),
        ),
      ],
      child: HomeScreen(),
    ),
    Container(),
    Container(),
  ];


  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.navy),
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


