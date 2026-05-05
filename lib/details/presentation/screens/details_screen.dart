import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

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
            fontWeight: FontWeight(600),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentGeometry.center,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Image.asset('assets/images/image 2.png'),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 20,
                    width: 120,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      child: Image.asset('assets/images/poster.png'),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    top: 220,
                    child: SizedBox(
                      width: 210,
                      child: Text(
                        'Spiderman No Way Home',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight(600),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.gray,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  '2021',
                  style: TextStyle(color: AppColors.gray, fontSize: 12),
                ),
                SizedBox(width: 6),
                SizedBox(
                  height: 20,
                  child: VerticalDivider(color: AppColors.gray, width: 1),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.access_time,
                  color: AppColors.gray,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  '148 Minutes',
                  style: TextStyle(color: AppColors.gray, fontSize: 12),
                ),
                SizedBox(width: 6),
                SizedBox(
                  height: 20,
                  child: VerticalDivider(color: AppColors.gray, width: 1),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.gray,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  'Action',
                  style: TextStyle(color: AppColors.gray, fontSize: 12),
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
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    'Reviews',
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),
                Tab(
                  child: Text(
                    'Cast',
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ),

              ],
            ),
            Expanded(child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight(400),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight(400),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight(400),
                ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
