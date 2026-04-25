import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/appcolors.dart';
import 'package:movie_app_march26/nav/presentation/widgets/custom_text_field.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  final List<String> imageUrls = const [
    'https://picsum.photos/id/101/600/400',
    'https://picsum.photos/id/102/600/400',
    'https://picsum.photos/id/103/600/400',
    'https://picsum.photos/id/104/600/400',
    'https://picsum.photos/id/105/600/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.navy),
      backgroundColor: AppColors.navy,
      body: Padding(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrls[0],
                      height: 250,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrls[1],
                      height: 250,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imageUrls[2],
                      height: 250,
                      width: 180,
                      fit: BoxFit.cover,
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
