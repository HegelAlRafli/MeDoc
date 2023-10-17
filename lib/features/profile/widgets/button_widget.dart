import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title, icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 24.h,
              width: 24.w,
              child: SvgPicture.asset('assets/icons/$icon.svg'),
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style:
                  textTheme.bodyText1?.copyWith(color: const Color(0xFF5F6368)),
            )
          ],
        ),
        SizedBox(height: 16.h),
        Divider(
          color: const Color(0xFFE5E5E5),
          height: 0,
          thickness: 1.5.h,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
