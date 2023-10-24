import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/description_content_widget.dart';
import '../widgets/playlist_widget.dart';

class MeditationDetailPage extends StatelessWidget {
  const MeditationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 72.h, bottom: 29.h),
                  width: size.width,
                  color: const Color(0xFFF2DBC2),
                  child: Center(
                    child: Image.asset(
                      'assets/illustrations/overthinking.png',
                      height: 175.h,
                      width: 175.w,
                    ),
                  ),
                ),
                Positioned(
                    left: 32.w,
                    top: 64.h,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back.svg',
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            const DescriptionContentWidget(),
            SizedBox(height: 8.h),
            const PlaylistWidget()
          ],
        ),
      ),
    );
  }
}
