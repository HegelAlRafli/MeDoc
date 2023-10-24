import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/color_value.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                      color: ColorValue.primaryColor,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/more.svg',
                    color: ColorValue.primaryColor,
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Text('Hilangkan Overthinking', style: textTheme.headline4),
              Text('Sesi 2', style: textTheme.headline2),
              Image.asset(
                'assets/images/music_meditation.png',
                height: 250.w,
                width: 250.h,
              ),
              SizedBox(height: 32.h),
              Text('Kenapa aku selalu salah?',
                  style: textTheme.headline4?.copyWith(fontSize: 16.sp)),
              SizedBox(height: 16.h),
              Text('By: Lucy fernandes, S.Psi. ', style: textTheme.bodyText1),
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: SvgPicture.asset(
                        'assets/icons/next.svg',
                        width: 30.w,
                      )),
                  SvgPicture.asset('assets/icons/play.svg', height: 80.w),
                  SvgPicture.asset(
                    'assets/icons/next.svg',
                    width: 30.w,
                  )
                ],
              ),
              SizedBox(height: 56.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0:01',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SvgPicture.asset(
                    'assets/icons/bar.svg',
                    width: 215.w,
                  ),
                  Text(
                    '4:12',
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
