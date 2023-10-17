import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/color_value.dart';

class PhotoProfile extends StatelessWidget {
  const PhotoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 124.h,
          width: 124.w,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(100.r),
            dashPattern: [19.w, 9.w],
            strokeCap: StrokeCap.round,
            color: ColorValue.primaryColor,
            strokeWidth: 3.w,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(6.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(
                      'assets/images/photoprofile.png',
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
          ),
        ),
        Positioned(
            bottom: -21,
            right: 1,
            left: 1,
            child: Container(
              height: 42.w,
              width: 42.w,
              decoration: BoxDecoration(
                  color: ColorValue.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4.h)),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/pencil.svg',
                  width: 18.w,
                  height: 19.h,
                ),
              ),
            ))
      ],
    );
  }
}
