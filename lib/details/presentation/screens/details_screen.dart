import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/colors.dart';
import 'package:movie_app_march26/details/presentation/controller/details_cubit.dart';
import 'package:movie_app_march26/details/presentation/controller/movies_cast_cubit/movies_cast_cubit.dart';
import 'package:movie_app_march26/details/presentation/controller/reviews_cubit/reviews_cubit.dart';
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
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.white),
        ),
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
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      ReviewsCubit()..getMovieReview(movie.id.toString()),
                ),
                BlocProvider(
                  create: (context) =>
                      MoviesCastCubit()..getMovieCast(movie.id.toString()),
                ),
              ],
              child: DefaultTabController(
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
                                movie.title.toString(),
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
                          movie.releaseDate.toString(),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
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
                          Icons.access_time,
                          color: AppColors.white,
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '${movie.runtime.toString()} minutes',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
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
                          movie.status.toString(),
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
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
                          BlocBuilder<ReviewsCubit, ReviewsState>(
                            builder: (context, state) {
                              if (state is MoviesReviewsLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is MoviesReviewsSuccess) {
                                var data = state.movie.results;
                                return ListView.separated(
                                  itemBuilder:
                                      (BuildContext context, int index)=>ListTile(
                                        leading: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                              child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${data[index].authorDetails.avatarPath}',
                                            errorBuilder: (context, error, stackTrace) => SizedBox(height: 40,width: 40,child: Icon(Icons.person),),
                                            height: 40,
                                            width: 50,
                                            fit: BoxFit.cover,
                                              ),

                                            ),
                                            Text(data[index].authorDetails.rating.toString(),
                                            style: TextStyle(
                                              color: AppColors.white
                                            ),)
                                          ],
                                        ),
                                        title: Text(data[index].authorDetails.name,
                                          style: TextStyle(
                                              color: AppColors.white
                                          ),),
                                        subtitle: Text(data[index].content,
                                          style: TextStyle(
                                              color: AppColors.white
                                          ),),
                                      ),
                                  separatorBuilder:
                                      (BuildContext context, int index)=> SizedBox(height: 5,),
                                  itemCount:data.length ,
                                );
                              }
                              return Center(
                                child: Text(
                                  //state.movie.id.toString(),
                                  'error in loading.',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            },
                          ),
                          BlocBuilder<MoviesCastCubit, MoviesCastState>(
                            builder: (context, state) {
                              if (state is MoviesCastLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is MoviesCastSuccess) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                        ),
                                    itemCount: state.movie.cast.length,
                                    itemBuilder:
                                        (
                                          BuildContext context,
                                          int index,
                                        ) => Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(70),
                                              child: Image.network(
                                                'https://image.tmdb.org/t/p/w500${state.movie.cast[index].profilePath} ',
                                                width: 140,
                                                height: 140,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error, stackTrace) => SizedBox(height: 140,width: 140,),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              state
                                                  .movie
                                                  .cast[index]
                                                  .originalName,
                                              style: TextStyle(
                                                color: AppColors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                  ),
                                );
                              }
                              return Center(
                                child: Text(
                                  //state.movie.id.toString(),
                                  'error in loading.',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
