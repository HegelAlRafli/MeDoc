import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget consulWidget(String text, String img, BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return Column(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            "assets/icons/tvshape.svg",
            height: 64.h,
            width: 64.w,
          ),
          Positioned(
            right: 0,
            top: 0,
            left: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.all(12.0.w),
              child: Image.asset(
                img,
                height: 20.h,
                width: 20.w,
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 8.h,
      ),
      Text(text,
          style: textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: Colors.black)),
    ],
  );
}
