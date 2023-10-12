import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget customTitleWidget (String title, String subTitle, String icon,BuildContext context){
  final textTheme = Theme.of(context).textTheme;
  return           Row(
    children: [
      Container(
        height: 30.h,
        width: 30.w,
        decoration: const BoxDecoration(
          color: Color(0xffF3F6F6),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: SvgPicture.asset(
              icon,
            )
        ),
      ),
      SizedBox(
        width: 12.w,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 14.sp)),
          Text(subTitle, style: textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w400, fontSize: 10.sp, color: const Color(0xff9B9B9B)
          ),)
        ],
      ),
    ],
  );
}