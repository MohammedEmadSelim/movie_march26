
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_cast/cast_cubit.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_details/details_cubit.dart';
import 'package:movie_app_march26/detailes/presentation/controller/movie_reviews/reviews_cubit.dart';
import 'package:movie_app_march26/home/data/models/movie_model.dart';

class DetailesScreen extends StatefulWidget {
   DetailesScreen({super.key, required this.movie});

   //final String movie_id;
   final MovieModel movie;

  @override
  State<DetailesScreen> createState() => _DetailesScreenState();
}

class _DetailesScreenState extends State<DetailesScreen> {

  @override
  void initState() {
    context.read<DetailsCubit>().DetailsMovies(widget.movie.id);
    context.read<ReviewsCubit>().MovieReviews(widget.movie.id);
    context.read<CastCubit>().MovieCast(widget.movie.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.navy,
        title: Center(
          child: Text("Detail",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: (){

                if(moviesBox.containsKey(widget.movie.id)){
                  moviesBox.delete(widget.movie.id);
                }else{
                  moviesBox.put(widget.movie.id, widget.movie);
                }
                setState(() {

                });
              },
              child: Icon(moviesBox.containsKey(widget.movie.id)
                  ?Icons.bookmark
                  :Icons.bookmark_border,
              color: AppColors.white,),
            ),
          ),
        ],
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
  builder: (context, state) {
    if(state is DetailsLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is DetailsSuccess){
      return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 220,
                  child: Image.network("https://image.tmdb.org/t/p/w500${state.movieDetails.backdropPath}",
                    fit: BoxFit.cover,),
                ),
                Positioned(
                  top: 138,
                  left: 28,
                  child: Container(
                    height: 175,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(37, 40, 54, 1),
                    ),

                  ),
                ),
                Positioned(
                  top: 140,
                  left: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network("https://image.tmdb.org/t/p/w500${state.movieDetails
                        .posterPath}",
                      height: 170,
                      width: 110,
                      fit: BoxFit.cover,
                    ),),
                ),
                Positioned(
                  top: 235,
                  left: 160,
                  right: 20,
                  child: Text(state.movieDetails.title,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(37, 40, 54, 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 3,),
                        Icon(Icons.star_border,color: AppColors.orange,),
                        SizedBox(width: 4,),
                        Text(state.movieDetails.voteAverage.toStringAsFixed(1),
                          style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(width: 5,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 115,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today_outlined,color: AppColors.grey2,),
                  SizedBox(width: 5,),
                  Text(DateTime.parse(state.movieDetails.releaseDate).year.toString(), style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(width: 15,),
                  Container(width: 3,height: 23,color: AppColors.grey2,),
                  SizedBox(width: 15,),
                  Icon(Icons.access_time,color: AppColors.grey2,),
                  SizedBox(width: 5,),
                  Text("${state.movieDetails.runtime} Minutes", style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(width: 15,),
                  Container(width: 3,height: 23,color: AppColors.grey2,),
                  SizedBox(width: 15,),
                  Icon(Icons.confirmation_number_outlined,color: AppColors.grey2,),
                  SizedBox(width: 5,),
                  Text(state.movieDetails.genres[0].name, style: TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
            SizedBox(height: 36,),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // indicatorColor: AppColors.white,
              dividerHeight: 0,
              tabs: [
                Tab(
                  child: Text(
                    "About Movie",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Cast",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TabBarView(
                  children: [
                    Text(state.movieDetails.overview,style: TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),),
                    BlocBuilder<ReviewsCubit, ReviewsState>(
                      builder: (context, state) {
                        if(state is ReviewsLoading){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        if(state is ReviewsSuccess){
                          return state.movieReviews.results.isNotEmpty ?ListView.separated(
                            separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 30,); },
                            itemCount: state.movieReviews.results.length,
                            itemBuilder: (context, index){
                              final review = state.movieReviews.results[index];
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundImage: review.authorDetails.avatarPath != null
                                            ? NetworkImage(
                                          "https://image.tmdb.org/t/p/w500${review.authorDetails.avatarPath}",
                                        )
                                            : AssetImage("assets/avatar 2.png") as ImageProvider,
                                      ),
                                      SizedBox(height: 20,),
                                      Text("${review.authorDetails.rating}", style: TextStyle(
                                        color: AppColors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    ],
                                  ),
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(review.author, style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          review.content,
                                          style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },

                          )
                              :Center(child: Text("No Reviews to show",
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,),));

                        }
                        if(state is ReviewsFailed){
                          return Text(state.message,style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),);
                        }
                        return Center(child: Text("Unknown error please try again later",style: TextStyle(color: AppColors.white),),);

  },
),
                    BlocBuilder<CastCubit, CastState>(
                      builder: (context, state) {
                        if(state is CastLoading){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        if(state is CastSuccess){
                          return GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2 / 2,
                            ) ,
                            itemCount: state.movieCast.cast.length,
                            itemBuilder: (context, index){
                              final cast = state.movieCast.cast[index];
                              return Column(
                                children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundImage: cast.profilePath != null
                                        ? NetworkImage(
                                      "https://image.tmdb.org/t/p/w500${cast.profilePath}",
                                    )
                                        : AssetImage("assets/avatar 2.png") as ImageProvider,
                                  ),
                                  SizedBox(height: 15,),
                                  Text(
                                    cast.name,
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ],
                              );
                            },

                          );

                        }
                        if(state is CastFailed){
                          return Text(state.message,style: TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),);
                        }
                        return Center(child: Text("Unknown error please try again later",style: TextStyle(color: AppColors.white),),);

  },
),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    if(state is DetailsFailed){
      return Center(child: Text(state.message),);
    }
    return Center(child: Text("Unknown error please try again later"),);

  },
),
    );
  }
}
