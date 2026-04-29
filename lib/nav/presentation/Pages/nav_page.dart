
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/home/presentation/Pages/HomePage.dart';
import 'package:movie_app_march26/home/presentation/controller/Carousel_cubit.dart';

class NavPage extends StatefulWidget {
  NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
 List<Widget> pages = [
  BlocProvider(
    create: (context) => CarouselCubit()..getCarouselMovies(),
    child: Homepage()),
  Text('sssssss'),
  Text('dddddddddddddd')
 ];

 int current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 3,
              color: Appcolor.fiv_color
            )
          )
        ),
        child: BottomNavigationBar(
          backgroundColor: Appcolor.prim_color,
          currentIndex: current_index,
          onTap: (value) {
            setState(() {
              current_index = value;
            });
          },
          selectedItemColor: Appcolor.fiv_color,
          unselectedItemColor: Appcolor.fort_color,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: 'Watch list')
        
        ]),
      ),
      
    );
  }
}
