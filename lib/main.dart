import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/Splash/Pages/SplashScreen.dart';
import 'package:movie_app_march26/Search/presentation/controller/cubit/search_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/details_cubit_cubit.dart';

void main() {
  runApp(const MovieApp());
}

// {}
// ctrl + shift + -
class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchCubitCubit()),
        BlocProvider(create: (context) => DetailsCubitCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
