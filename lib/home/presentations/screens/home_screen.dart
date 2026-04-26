import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/home/presentations/controller/carousel_cubit.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> imageUrls = [
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What do you want to watch?",
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            CustomTextForm(
              readOnly: true,
              onTap: () {
                print("tapped");
              },
            ),
            SizedBox(height: 36),
            // SizedBox(
            //   height: 300,
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) => SizedBox(width: 18),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: imageUrls.length,
            //     itemBuilder: (context, index) => ClipRRect(
            //       borderRadius: BorderRadius.circular(16),
            //       child: Image.network(
            //         imageUrls[index],
            //         height: 250,
            //         width: 180,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            BlocBuilder<CarouselCubit, CarouselState>(
              builder: (context, state) {
                print("state==========>$state");
                if (state is CarouselLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is CarouselSuccess) {
                  var data = state.movies;
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlayCurve: Curves.bounceOut,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      enlargeCenterPage: true,
                      autoPlay: true,
                      viewportFraction: 0.5,
                    ),
                    itemCount: imageUrls.length,
                    itemBuilder:
                        (
                        BuildContext context,
                        int itemIndex,
                        int pageViewIndex,
                        ) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500${data[itemIndex].posterPath}",
                        height: 250,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }

                if (state is CarouselFailure) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  );
                }
                return Center(child: Text("some unexpected has been happened",style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                )));
              },
            ),
            SizedBox(height: 36),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // indicatorColor: AppColors.white,
              dividerHeight: 0,
              tabs: [
                Tab(
                  child: Text(
                    "Now Playing",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Up Coming",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Top Rated",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: TabBarView(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                    ),
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        imageUrls[index],
                        height: 250,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    itemCount: imageUrls.length,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "up coming ",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "top rated ",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "popular ",
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}