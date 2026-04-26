import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/screens/home_screen.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    BlocProvider(
      create: (context) => CarouselCubit()..getCarouselMovies(),
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



