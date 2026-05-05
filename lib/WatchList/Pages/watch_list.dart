import 'package:flutter/material.dart';
import 'package:movie_app_march26/Search/presentation/widgets/card_movie.dart';
import 'package:movie_app_march26/Search/presentation/widgets/custom_row_serachpage.dart';
import 'package:movie_app_march26/core/cache/hive_boxes.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/core/theme/widgets/custom_image_network.dart';
import 'package:movie_app_march26/nav/presentation/Pages/nav_page.dart';

class WatchList extends StatefulWidget {
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons
                .arrow_back_ios_new, // شكل سهم الـ iOS الأنيق، أو استخدم Icons.arrow_back
            color: Appcolor.seco_color, // لون السهم نفس لون النص
            size: 18, // حجم السهم
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavPage())); // أمر الرجوع للصفحة السابقة
          },
        ),
        backgroundColor: Appcolor.prim_color,
        centerTitle: true,
        title: Text(
          'Watch List',
          style: TextStyle(color: Appcolor.seco_color, fontSize: 18),
        ),
       
      ),
      backgroundColor: Appcolor.prim_color,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 18),
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: moviesBox.length,
                itemBuilder: (context, index) {
                  var movie = moviesBox.getAt(index);
                  return Stack(
                    children: [
                      Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child:
                                Custom_image_network(data: moviesBox.values.toList(), index: index, height: 120, width: 95)
                                //  Image.network(
                                //   "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                //   height: 120,
                                //   width: 95,
                                //   fit: BoxFit.cover,
                                  
                                // ),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 195,
                                    child: Text(
                                     ' ${movie!.title}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16, color: Appcolor.seco_color),
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  custom_row_serach_page(
                                    text: movie.voteAverage.toString().substring(0,3),
                                    color: Appcolor.six_color,
                                    iconData: Icons.star_border,
                                  ),
                                  custom_row_serach_page(
                                    text: 'Action',
                                    iconData: Icons.confirmation_number_outlined,
                                  ),
                                  custom_row_serach_page(
                                    text: movie.releaseDate,
                                    iconData: Icons.calendar_today_outlined,
                                  ),
                                  custom_row_serach_page(
                                    text: '${movie.voteCount+10} minutes',
                                    iconData: Icons.access_time,
                                  ),
                                ],
                              ),
                            ],
                          ),
                    Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            if (moviesBox.containsKey(movie.id)) {
                              moviesBox.delete(movie.id);
                            } else {
                              moviesBox.put(movie.id, movie);
                            }
                            setState(() {});
                          },
                          child: Icon(size: 20,
                            moviesBox.containsKey(movie.id)
                                ? Icons.remove_circle
                                : Icons.add_circle_outline,
                            color: moviesBox.containsKey(movie.id)
                                ? Appcolor.red_color
                                : Appcolor.green_color,
                          ),
                        ),
                      ),
                    ],
                  );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class custom_row_movie extends StatelessWidget {
  const custom_row_movie({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500{.posterPath}",
            height: 120,
            width: 95,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 195,
              child: Text(
                ' movie.title',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, color: Appcolor.seco_color),
              ),
            ),
            SizedBox(height: 3),
            custom_row_serach_page(
              text: 'movie.voteAverage.toString().substring(0,3)',
              color: Appcolor.six_color,
              iconData: Icons.star_border,
            ),
            custom_row_serach_page(
              text: 'Action',
              iconData: Icons.confirmation_number_outlined,
            ),
            custom_row_serach_page(
              text: 'movie.releaseDate',
              iconData: Icons.calendar_today_outlined,
            ),
            custom_row_serach_page(
              text: '{movie.voteCount+10} minutes',
              iconData: Icons.access_time,
            ),
          ],
        ),
      ],
    );
  }
}
//  Stack(
//                     children: [
//                       Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.network(
//                               "https://image.tmdb.org/t/p/w500${movie!.posterPath}",
//                               height: 210,
//                               width: 150,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   SizedBox(
//                                     height: 210,
//                                     width: 150,
//                                     child: Icon(Icons.error_outline),
//                                   ),
//                             ),
//                           ),
//                           SizedBox(width: 14),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 width: 100,
//                                 child: Text(
//                                   '${movie!.title}',
//                                   style: TextStyle(
//                                     color: Appcolor.seco_color,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 18,
//                                   ),
//                                   maxLines: 1,
//                                 ),
//                               ),
//                               SizedBox(height: 18),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.star_border,
//                                     color: Appcolor.sev_color,
//                                     size: 18,
//                                   ),
//                                   SizedBox(width: 3),
//                                   Text(
//                                     '${movie.voteAverage}',
//                                     style: TextStyle(
//                                       color: Appcolor.sev_color,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.confirmation_number_outlined,
//                                     color: Appcolor.seco_color,
//                                     size: 18,
//                                   ),
//                                   SizedBox(width: 3),
//                                   Text(
//                                     'action',
//                                     style: TextStyle(
//                                       color: Appcolor.seco_color,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.calendar_today_outlined,
//                                     color: Appcolor.seco_color,
//                                     size: 18,
//                                   ),
//                                   SizedBox(width: 3),
//                                   Text(
//                                     '${movie!.releaseDate}',
//                                     style: TextStyle(
//                                       color: Appcolor.seco_color,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.access_time,
//                                     color: Appcolor.seco_color,
//                                     size: 18,
//                                   ),
//                                   SizedBox(width: 3),
//                                   Text(
//                                     '139 minutes',
//                                     style: TextStyle(
//                                       color: Appcolor.seco_color,
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 4),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Positioned(
//                         right: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             if (moviesBox.containsKey(movie.id)) {
//                               moviesBox.delete(movie.id);
//                             } else {
//                               moviesBox.put(movie.id, movie);
//                             }
//                             setState(() {});
//                           },
//                           child: Icon(
//                             moviesBox.containsKey(movie.id)
//                                 ? Icons.remove_circle
//                                 : Icons.add_circle_outline,
//                             color: moviesBox.containsKey(movie.id)
//                                 ? Appcolor.red_color
//                                 : Appcolor.green_color,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
               