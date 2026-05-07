

import 'package:flutter/material.dart';

import 'package:movie_app_march26/core/theme/AppColor.dart';

import 'package:movie_app_march26/details/data/models/Details_movie_model.dart';
import 'package:movie_app_march26/details/presentation/widgets/Tab_Cast.dart';
import 'package:movie_app_march26/details/presentation/widgets/tap_about.dart';
import 'package:movie_app_march26/details/presentation/widgets/tap_review.dart';
import 'package:movie_app_march26/home/presentation/widgets/tab_name_tabs.dart';

class Show_details_in_details_page extends StatefulWidget {
  const Show_details_in_details_page({super.key, required this.deta});
  final MovieDetailsModel deta;

  @override
  State<Show_details_in_details_page> createState() =>
      _Show_details_in_details_pageState();
}

class _Show_details_in_details_pageState
    extends State<Show_details_in_details_page> {
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
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500${widget.deta.backdropPath}",
                  ),
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
                        Icon(Icons.star, color: Color(0xFFFF9900), size: 12),
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
                    ' ' + widget.deta.releaseDate.toString().substring(0, 4),
                    style: TextStyle(color: Appcolor.fort_color, fontSize: 15),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  '|',
                  style: TextStyle(color: Appcolor.fort_color, fontSize: 20),
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
                  style: TextStyle(color: Appcolor.fort_color, fontSize: 15),
                ),
                SizedBox(width: 12),
                Text(
                  '|',
                  style: TextStyle(color: Appcolor.fort_color, fontSize: 20),
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
                    style: TextStyle(color: Appcolor.fort_color, fontSize: 15),
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              //indicatorColor: Appcolor.fort_color,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Appcolor.fort_color),
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
              child: TabBarView(
                children: [
                  tap_about(
                    about:
                        widget.deta.overview ??
                        'No Inforamation about this filem',
                  ),
                  tap_review(),
                  Tab_Cast(),
                ],
              ),
            ),
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
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
