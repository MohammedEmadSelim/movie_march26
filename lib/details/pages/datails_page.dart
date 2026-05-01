import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/nav/presentation/widgets/tab_name_tabs.dart';

class DatailsPage extends StatelessWidget {
  const DatailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Appcolor.prim_color,
        appBar: AppBar(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.bookmark, size: 30, color: Colors.white),
            ),
          ],
        ),
        body: Stack(
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
                      child: Image.asset('assets/images/spider.png'),
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
                          children: const [
                            Icon(
                              Icons.star,
                              color: Color(0xFFFF9900),
                              size: 12,
                            ),
                            SizedBox(width: 6),
                            Text(
                              '9.5',
                              style: TextStyle(
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
                    Text(
                      ' 2021',
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
                      Icons.access_time_outlined,
                      color: Appcolor.fort_color,
                      size: 18,
                    ),
                    Text(
                      ' 148 Minutes',
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
                    Text(
                      ' Action',
                      style: TextStyle(
                        color: Appcolor.fort_color,
                        fontSize: 15,
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
                    Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
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
                    child: Image.asset(
                      'assets/images/pos.png',
                      height: 120,
                      width: 90,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Spiderman No Way\n Home',
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
        ),
      ),
    );
  }
}
