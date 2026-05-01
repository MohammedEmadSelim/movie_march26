import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_cast/cast_cubit.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_details/details_cubit.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_reviews/reviews_cubit.dart';
import 'package:movie_app_march26/splash/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailsCubit(),),
        BlocProvider(create: (context) => ReviewsCubit(),),
        BlocProvider(create: (context) => CastCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
        ),
      );
  }
}




