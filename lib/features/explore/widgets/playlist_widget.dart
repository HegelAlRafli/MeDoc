import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../pages/audio.dart';

class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView.builder(
      itemCount: 15,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AudioPage(),
                ));
          },
          child: Column(
            children: [
              const Divider(
                height: 32,
                thickness: 1,
                color: Color(0xFFE5E5E5),
              ),
              Row(
                children: [
                  SizedBox(width: 30.w),
                  Image.asset(
                    'assets/images/music_meditation.png',
                    height: 60.h,
                    width: 60.w,
                  ),
                  SizedBox(width: 24.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sesi ${index + 1}',
                        style: textTheme.headline4,
                      ),
                      Text(
                        '${index + 3}m ${index + 12}detik',
                        style: textTheme.bodyText2?.copyWith(fontSize: 10.sp),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/icons/play.svg'),
                  SizedBox(width: 30.w),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
