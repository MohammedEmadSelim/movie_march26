
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/widgets/loading_circler.dart';
import 'package:movie_app_march26/details/data/models/cast_model.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/cast_cubit_cubit.dart';
import 'package:movie_app_march26/details/presentation/widgets/custom_cast_details.dart';

class Tab_Cast extends StatelessWidget {
  const Tab_Cast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubitCubit, CastCubitState>(
      builder: (context, state) {
        if (state is CatsCubitLoading) {
          return loading_circler();
        } else if (state is CastCubitSuccess) {
          List<Cast> Casts = state.castses;
          if (Casts.isEmpty) {
            return const Center(
              child: Text(
                'No Casts found.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          // تم حذف الـ SingleChildScrollView والـ Column والـ Expanded الزيادة
          return  GridView.builder(
          padding: const EdgeInsets.all(10),
          // 1. Define the structure
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 40, // Space between columns
                mainAxisSpacing: 10, // Space between rows
              ),
          // 2. Define the number of items
          itemCount: Casts.length,
          // 3. Build the actual widget for each index
          itemBuilder: (context, index) {
            return custom_cast_details(name: Casts[index].name,image: Casts[index].profilePath,);
          },
        );
        } else if (state is CastCubitFailure) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
