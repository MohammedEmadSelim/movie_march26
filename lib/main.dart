import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_march26/details/presentation/controller/details_cubit.dart';
import 'package:movie_app_march26/home/data/models/movie_model.g.dart';
import 'core/cache/hive_boxes.dart';
import 'home/data/models/movie_model.dart';
import 'splash/presentation/splash_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: SplachScreen(),
      ),
    );
  }
}

