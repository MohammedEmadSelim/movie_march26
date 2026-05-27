import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_march26/details_screen/presentation/controllers/details_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/now_playing_cubit/now_playing_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/popular_cubit/popular_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/top_rated_cubit/top_rated_cubit.dart';
import 'package:movie_app_march26/home/presentations/controller/up_coming_cubit/up_coming_cubit.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/splash/presentation/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(MovieModelAdapter());

  await Hive.openBox<MovieModel>('movies');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailsCubit()),
        BlocProvider(
          create: (context) => CarouselCubit()..getCarouselMovies(),
        ),
        BlocProvider(
          create: (context) => NowPlayingCubit()..getNowPlaying(),
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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}