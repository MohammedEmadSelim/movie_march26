import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';
import 'package:movie_app_march26/nav/presentation/widgets/tab_name_tabs.dart';

class NavPage extends StatelessWidget {
  NavPage({super.key});
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
      child: Scaffold(
        backgroundColor: Appcolor.prim_color,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: TextStyle(
                  color: Appcolor.seco_color,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              custom_text_field(text: 'Search', iconData: Icons.search),
              SizedBox(height: 15),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 220,
                  autoPlayCurve: Curves.bounceOut,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.6,
                ),
                itemCount: imageUrls.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  'assets/images/popcorn 1.png',
                                  height: 220,
                                  width: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 10,
                              child: Stack(
                                children: [
                                  // النص ذو الحدود (Outline)
                                  Text(
                                    '${(itemIndex + 1)}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 3
                                        ..color = Colors.blue,
                                    ),
                                  ),
                                  // النص الداخلي
                                  Text(
                                    '${(itemIndex + 1)}',
                                    style: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff242A32),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
              ),
              SizedBox(height: 15),
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
                  tab_name_tabs(text: 'Now playing'),
                  tab_name_tabs(text: 'Upcoming'),
                  tab_name_tabs(text: 'Top rated'),
                  tab_name_tabs(text: 'Popular'),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Card(child: Center(child: Text('عنصر ${(index+1)}')));
                      },
                    ),
                    Text('ddd'),
                    Text('ddd'),
                    Text('ddd'),
                  ],
                ),
              ),
              //  using sizebox and clirrect
              // SizedBox(
              //   height: 300,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: imageUrls.length,
              //     itemBuilder: (context, index) => Padding(
              //       padding: const EdgeInsets.only(right: 10),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(15),
              //         child: Image.network(imageUrls[index],height: 250,width: 180,fit: BoxFit.cover,)),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
