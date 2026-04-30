
import 'package:flutter/material.dart';
import 'package:movie_app_march26/core/theme/AppColor.dart';

class loading_circler extends StatelessWidget {
  const loading_circler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // دائرة خلفية باهتة لتعطي عمقاً
          CircularProgressIndicator(
            strokeWidth: 2,
            value: 1.0,
            valueColor: AlwaysStoppedAnimation<Color>(
              Appcolor.fort_color.withOpacity(0.2),
            ),
          ),
          // الدائرة المتحركة الأساسية
          CircularProgressIndicator(
            strokeWidth: 3, // اجعلها أسمك قليلاً من الخلفية
            color: Appcolor.fort_color,
            strokeCap: StrokeCap
                .round, // تجعل حواف التحميل دائرية وليست حادة
          ),
        ],
      ),
    );
  }
}

            //  using sizebox and clirrect
            //   SizedBox(
            //     height: 300,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: imageUrls.length,
            //       itemBuilder: (context, index) => Padding(
            //         padding: const EdgeInsets.only(right: 10),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(15),
            //           child: Image.network(imageUrls[index],height: 250,width: 180,fit: BoxFit.cover,)),
            //       ),
            //     ),
            //   ),
