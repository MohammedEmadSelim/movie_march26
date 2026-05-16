

import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

Box<MovieModel> get moviesBox => Hive.box<MovieModel>('movies');