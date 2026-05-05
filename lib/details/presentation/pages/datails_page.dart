import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/core/theme/widgets/loading_circler.dart';
import 'package:movie_app_march26/details/data/models/Details_movie_model.dart';
import 'package:movie_app_march26/details/presentation/controller/cubit/details_cubit_cubit.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

import 'package:movie_app_march26/nav/presentation/widgets/tab_name_tabs.dart';

class DatailsPage extends StatefulWidget {
  const DatailsPage({super.key, required this.id,required this.movie});
final int id;
final MovieModel movie;
  @override
  State<DatailsPage> createState() => _DatailsPageState();
}

class _DatailsPageState extends State<DatailsPage> {
  @override
  void initState() {
    context.read<DetailsCubitCubit>().get_details(widget.id.toString());
    // TODO: implement initState
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
            Icons
                .arrow_back_ios_new, 
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
            if(state is DetailsCubitLoading){
              return loading_circler();
            }else if(state is DetailsCubitSuccess){
              var data = state.details;
              return Show_details_in_details_page(deta: data);
            }else if(state is DetailsCubitFailure){
             return Center(child: Text(state.error,style: TextStyle(color: Colors.white),)); 
            }else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}

class Show_details_in_details_page extends StatefulWidget {
  const Show_details_in_details_page({
    super.key, required this.deta,
  });
final MovieDetailsModel deta;

  @override
  State<Show_details_in_details_page> createState() => _Show_details_in_details_pageState();
}

class _Show_details_in_details_pageState extends State<Show_details_in_details_page> {
  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Image.network( "https://image.tmdb.org/t/p/w500${widget.deta.backdropPath}"),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C313C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xFFFF9900),
                              size: 12,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${(widget.deta.voteAverage).toString().substring(0, 3)}',
                              style: const TextStyle(
                                color: Color(0xFFFF9900),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Appcolor.fort_color,
                      size: 18,
                    ),
                    Flexible(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,                      
                        ' '+widget.deta.releaseDate.toString().substring(0, 3),
                        style: TextStyle(
                          color: Appcolor.fort_color,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Appcolor.fort_color,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.access_time_outlined,
                      color: Appcolor.fort_color,
                      size: 18,
                    ),
                    Text(
                        overflow: TextOverflow.ellipsis,
                      maxLines: 1, 
                       widget.deta.runtime.toString() + ' Minutes',
                      style: TextStyle(
                        color: Appcolor.fort_color,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      '|',
                      style: TextStyle(
                        color: Appcolor.fort_color,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.confirmation_number_outlined,
                      color: Appcolor.fort_color,
                      size: 18,
                    ),
                    Flexible(
                      child: Text(
                          overflow: TextOverflow.ellipsis,
                        maxLines: 1, 
                        ' ${widget.deta.title}',
                        style: TextStyle(
                          color: Appcolor.fort_color,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                  ],
                ),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  //indicatorColor: Appcolor.fort_color,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Appcolor.fort_color,
                    ),
                  ),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerHeight: 0,
                  tabs: [
                    tab_name_tabs(text: 'About Movie'),
                    tab_name_tabs(text: 'Reviews'),
                    tab_name_tabs(text: 'Cast'),
                  ],
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: TabBarView(
                    children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines:8, 
                      '${widget.deta.overview}',
                    style: TextStyle(color: Colors.white),
                    ),
                    Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.'),
                    Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.')
                  
                  ]),
                ),
              )
              ],
            ),
            Positioned(
              top: 143,
              left: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${widget.deta.posterPath}',
                      height: 120,
                      width: 90,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    '${widget.deta.title}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 55),
                  //   child: Text('Spiderman No Way\n Home',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                  // )
                ],
              ),
            ),
          ],
        );
  }
}
