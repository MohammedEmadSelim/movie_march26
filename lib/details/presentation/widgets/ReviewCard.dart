
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String authorName;
  final String content;
  final double rating;
  final String? avatarUrl;
final String? image;
  const ReviewCard({
    super.key,
    required this.authorName,
    required this.content,
    required this.rating,
    this.avatarUrl,  this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الـ Avatar والـ Rating تحته
          Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[800],
                backgroundImage: image == null ? AssetImage('assets/images/imag_d.png') : NetworkImage('https://image.tmdb.org/t/p/w500$image',),
              ),
              const SizedBox(height: 8),
              Text(
                rating.toString(),
                style: const TextStyle(
                  color: Colors.blue, // نفس اللون اللي في الصورة
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // اسم صاحب الريفيو والكلام
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  style:  TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4, // علشان المسافات بين السطور تكون مريحة
                  ),
                  maxLines: 5, // اختياري لو عاوز تحدد طول الكلام
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
