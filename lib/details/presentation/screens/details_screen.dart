import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/details/presentation/controller/details_cubit.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.movie});

  final MovieModel movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    context.read<DetailsCubit>().getMovieDetails(widget.movie.id.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      appBar: AppBar(
        backgroundColor: AppColors.navy,
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (moviesBox.containsKey(widget.movie.id)) {
                moviesBox.delete(widget.movie.id);
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
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DetailsSuccess) {
            var movie = state.movie;
            return DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      alignment: AlignmentGeometry.bottomCenter,
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          top: 0,
                          child: SizedBox(
                            height: 400,
                            child: ClipRRect(
                              borderRadius: BorderRadiusGeometry.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 20,
                          width: 120,
                          height: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 150,
                          bottom: 0,
                          child: SizedBox(
                            width: 210,
                            child: Text(
                              'Spiderman No Way Home',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.white,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        '2021',
                        style: TextStyle(color: AppColors.white, fontSize: 12),
                      ),
                      SizedBox(width: 6),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          color: AppColors.white,
                          width: 1,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.access_time, color: AppColors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        '148 Minutes',
                        style: TextStyle(color: AppColors.white, fontSize: 12),
                      ),
                      SizedBox(width: 6),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          color: AppColors.white,
                          width: 1,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.calendar_today_outlined,
                        color: AppColors.white,
                        size: 16,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Action',
                        style: TextStyle(color: AppColors.white, fontSize: 12),
                      ),
                      SizedBox(width: 6),
                    ],
                  ),
                  TabBar(
                    dividerHeight: 0,
                    indicatorColor: AppColors.white,
                    labelColor: AppColors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        child: Text(
                          'About Movie',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Cast',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.overview.toString(),
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is DetailsFailure) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }
          return Center(
            child: Text(
              "unKnown error has been happen please try again later",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}