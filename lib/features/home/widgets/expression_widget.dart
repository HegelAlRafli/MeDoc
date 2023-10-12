import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget expressionWidget(
    String image, String text, int color, Widget widget, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 64.h,
            width: 64.w,
            decoration: BoxDecoration(
                color: Color(color), borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: SvgPicture.asset(
              image,
              height: 40.h,
              width: 40.w,
            ))),
        SizedBox(
          height: 8.h,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: Colors.black),
        ),
        SizedBox(
          height: 24.h,
        )
      ],
    ),
  );
}
