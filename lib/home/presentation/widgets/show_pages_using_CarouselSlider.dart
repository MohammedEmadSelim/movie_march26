import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';
import 'package:movie_app_march26/home/data/modules/Movie_model.dart';

class show_pages_using_CarouselSlider extends StatelessWidget {
  const show_pages_using_CarouselSlider({
    super.key,
    required this.data,
  });

  final List<MovieModel> data;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
     // 1. الأبعاد والنسب
  height: 400, // حدد الارتفاع المناسب لتصميمك (مثلاً 400 للبوسترات الكبيرة أو 200 للبنرات)
  aspectRatio: 16 / 9, // النسبة بين العرض والارتفاع في حال لم تحدد الارتفاع
  viewportFraction: 0.8, // يعرض 80% من العنصر الحالي، ويظهر 10% من العناصر المجاورة على الجوانب

  // 2. التشغيل التلقائي (Auto Play)
  autoPlay: true, // تفعيل التمرير التلقائي
  autoPlayInterval: const Duration(seconds: 4), // المدة بين كل حركة وتغيير
  autoPlayAnimationDuration: const Duration(milliseconds: 800), // سرعة حركة التغيير نفسها
  autoPlayCurve: Curves.fastOutSlowIn, // منحنى الحركة (يجعلها تبدو طبيعية وسلسة)

  // 3. التفاعل والتحكم
  enlargeCenterPage: true, // تكبير العنصر المعروض في المنتصف لتمييزه عن العناصر الجانبية
  enlargeFactor: 0.3, // نسبة التكبير (كلما زادت، زاد الفارق بين العنصر الأساسي والجانبي)
  enableInfiniteScroll: true, // يجعل القائمة تدور بشكل لا نهائي دون توقف عند البداية أو النهاية

  // 4. اتجاه الحركة وسلوك التمرير
  scrollDirection: Axis.horizontal, // التمرير أفقي
  reverse: false, // التمرير من اليسار لليمين بشكل طبيعي

  // 5. إدارة الحالة (Callback)
  onPageChanged: (index, reason) {
    // يمكنك استخدام هذا لتحديث نقاط المؤشر (Dots Indicator) تحت الكاروسيل
    // print('الصفحة الحالية: $index');
  },
    
      ),
      itemCount: data.length,
      itemBuilder:
          (
            BuildContext context,
            int itemIndex,
            int pageViewIndex,
          ) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500${data[itemIndex].posterPath}",
                  height: 200,
                  width: 150,
                  fit: BoxFit.cover,
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
                          ..color = Appcolor.fiv_color,
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
    );
  }
}
