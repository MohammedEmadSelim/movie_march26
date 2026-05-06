import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/core/theme/widgets/loading_circler.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/cast_cubit_cubit.dart';

import 'package:movie_app_march26/details/presentation/controller/cubit/details_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/review_det_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/widgets/Show_details_in_details_page.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';



class DatailsPage extends StatefulWidget {
  const DatailsPage({super.key, required this.id, required this.movie});
  final int id;
  final MovieModel movie;
  @override
  State<DatailsPage> createState() => _DatailsPageState();
}

class _DatailsPageState extends State<DatailsPage> {
  @override
  void initState() {
    context.read<DetailsCubitCubit>().get_details(widget.id.toString());
    context.read<ReviewDetCubitCubit>().getReviews(widget.id.toString());
    context.read<CastCubitCubit>().get_details(widget.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Appcolor.prim_color,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Appcolor.seco_color,
              size: 18,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: Appcolor.prim_color,
          title: Text(
            'Detail',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                if (moviesBox.containsKey(widget.id)) {
                  moviesBox.delete(widget.id);
                } else {
                  moviesBox.put(widget.movie.id, widget.movie);
                }
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  moviesBox.containsKey(widget.movie.id)
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  color: Appcolor.seco_color,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<DetailsCubitCubit, DetailsCubitState>(
          builder: (context, state) {
            if (state is DetailsCubitLoading) {
              return loading_circler();
            } else if (state is DetailsCubitSuccess) {
              var data = state.details;
              return Show_details_in_details_page(deta: data);
            } else if (state is DetailsCubitFailure) {
              return Center(
                child: Text(state.error, style: TextStyle(color: Colors.white)),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

