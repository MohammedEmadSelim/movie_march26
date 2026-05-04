
import 'package:flutter/material.dart';
import 'package:movie_app_march26/details/presentation/pages/datails_page.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class Custom_image_network extends StatelessWidget {
  const Custom_image_network({
    super.key,
    required this.data, required this.index, required this.height, required this.width, this.fit =BoxFit.fill,
  });

  final List<MovieModel> data;
  final int index;
  final double height , width ;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => DatailsPage(id: data[index].id,)));
      },
      child: Image.network(
        "https://image.tmdb.org/t/p/w500${data[index].posterPath}",
        height: height, 
        width: width,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => SizedBox(
                height: height,
                width: width,
                child: Icon(Icons.error_outline),
              ),
      ),
    );
  }
}