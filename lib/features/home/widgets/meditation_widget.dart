import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';

Widget meditationWidget(BuildContext context, String image, String title,
    String subTitle, int color) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 28.w),
        height: 77.h,
        width: MediaQuery.of(context).size.width - 56.w,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffF6F6F6),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 77.h,
              width: 6.w,
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r)),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 50.h,
              width: 50.w,
              decoration: const BoxDecoration(
                color: Color(0xffF3F6F6),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  image,
                  height: 32.h,
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: const Color(0xff9B9B9B)),
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/icons/arrow_right.png',
              color: ColorValue.primaryColor,
              height: 15.h,
            ),
            SizedBox(
              width: 16.w,
            )
          ],
        ),
      ),
    ],
  );
}
