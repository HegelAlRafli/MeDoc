import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../pages/meditation_details.dart';

class ExploreContentWidget extends StatelessWidget {
  const ExploreContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      decoration: BoxDecoration(
          color: ColorValue.backgroundColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Text('Beberapa meditasi yang kami sarankan untuk kamu',
            style: textTheme.headline4?.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 24.h),
          ListView.builder(
            itemCount: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MeditationDetailPage(),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 8.h),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 19.w),
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: ColorValue.greyColor),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Mengatasi Anxiety',
                            style: textTheme.headline4,
                          ),
                          Text(
                            '7 Sesi Meditasi',
                            style: textTheme.bodyText2,
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/illustrations/meditasi.png',
                        height: 77.h,
                        width: 70.w,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
