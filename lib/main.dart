import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_cast/cast_cubit.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_details/details_cubit.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_reviews/reviews_cubit.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/splash/presentation/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  moviesBox = await Hive.openBox<MovieModel>("movies");
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




