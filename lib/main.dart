import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_march26/Splash/Pages/SplashScreen.dart';
import 'package:movie_app_march26/Search/presentation/controller/cubit/search_cubit_cubit.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/cast_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/details_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/review_det_cubit_cubit.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. تعمل init للـ Hive
  await Hive.initFlutter();
  
  // 2. تسجل الـ Adapter (لو عامل Model)
  Hive.registerAdapter(MovieModelAdapter());
  
  // 3. تفتح الـ Box وتخزن قيمته في المتغير اللي أنت معرفه
  moviesBox = await Hive.openBox<MovieModel>('movies_box'); 

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
         BlocProvider(
          create: (context) => ReviewDetCubitCubit(),
        ),
        BlocProvider(create: (context) => CastCubitCubit()),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
