import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/colors.dart';
import 'package:movie_app_march26/search/presentation/search_screen.dart';
import 'package:movie_app_march26/watch_list/presentation/watch_list_screen.dart';

import 'widgets/custom_text_form_field.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    WatchListScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navy,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.gray,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watch list',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    "https://images.unsplash.com/photo-1516117172878-fd2c41f4a759",
    "https://images.unsplash.com/photo-1495567720989-cebdbdd97913",
    "https://images.unsplash.com/photo-1472214103451-9374bd1c798e",
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    "https://images.unsplash.com/photo-1516117172878-fd2c41f4a759",
    "https://images.unsplash.com/photo-1495567720989-cebdbdd97913",
    "https://images.unsplash.com/photo-1472214103451-9374bd1c798e",
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
    "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d",
    "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
    "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    "https://images.unsplash.com/photo-1516117172878-fd2c41f4a759",
    "https://images.unsplash.com/photo-1495567720989-cebdbdd97913",
    "https://images.unsplash.com/photo-1472214103451-9374bd1c798e",
    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    "https://images.unsplash.com/photo-1469474968028-56623f02e42e",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to watch?',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight(600),
                ),
              ),
              SizedBox(height: 30),
              CustomTextFormField(),
              SizedBox(height: 30),
              CarouselSlider.builder(
                options: CarouselOptions(
                  autoPlayCurve: Curves.decelerate,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  autoPlay: true,
                  viewportFraction: 0.5,
                ),
                itemCount: imageUrls.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(16),
                          child: Image.network(
                            imageUrls[itemIndex],
                            height: 250,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
              ),
              SizedBox(height: 36),
              TabBar(
                dividerHeight: 0,
                indicatorColor: AppColors.white,
                labelColor: AppColors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      'Now Playing',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Up Coming',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Top Rated',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Popular',
                      style: TextStyle(color: AppColors.white, fontSize: 12),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: imageUrls.length,
                      padding: EdgeInsets.only(top: 8),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: imageUrls.length,
                      padding: EdgeInsets.only(top: 8),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: imageUrls.length,
                      padding: EdgeInsets.only(top: 8),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: imageUrls.length,
                      padding: EdgeInsets.only(top: 8),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
