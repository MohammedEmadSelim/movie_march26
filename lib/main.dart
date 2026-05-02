import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/details_screen/presentation/controllers/details_cubit.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';
import 'package:movie_app_march26/search/presentation/controllers/search_cubit.dart';
import 'package:movie_app_march26/splash/presentation/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // register the generated adapter
  Hive.registerAdapter(MovieModelAdapter());
// open the box and pass the value to global Box
  moviesBox = await Hive.openBox<MovieModel>("movie_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
