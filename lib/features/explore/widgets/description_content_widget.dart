import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DescriptionContentWidget extends StatelessWidget {
  const DescriptionContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hilangkan Overthinking',
                style: textTheme.headline1
                    ?.copyWith(fontSize: 16.sp, color: Colors.black),
              ),
              Text(
                '56 Menit',
                style: textTheme.bodyText2?.copyWith(fontSize: 10.sp),
              )
            ],
          ),
          Text(
            'Dr. Howarts Carington',
            style: textTheme.bodyText2?.copyWith(color: Colors.black),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset('assets/icons/star.svg'),
              SizedBox(width: 4.w),
              SvgPicture.asset('assets/icons/star.svg'),
              SizedBox(width: 4.w),
              SvgPicture.asset('assets/icons/star.svg'),
              SizedBox(width: 4.w),
              SvgPicture.asset('assets/icons/star.svg'),
              SizedBox(width: 4.w),
              SvgPicture.asset('assets/icons/star.svg'),
              SizedBox(width: 4.w),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Playlist ini dibuat untuk membantu kalian untuk tetap tenang dan dapat mencegah terjadinya “overthinking”, Dengan Mendengarkan setiap sesi akan membuat semakin tenang. ',
            style: textTheme.bodyText2?.copyWith(fontSize: 10.sp),
          )
        ],
      ),
    );
  }
}
