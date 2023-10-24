import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'Notifikasi',
                    style: textTheme.headline4?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hari ini',
                        style: textTheme.bodyText1?.copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 40.w,
                                      height: 40.h,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff153B50),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0.h),
                                        child: SvgPicture.asset(
                                          'assets/icons/info.svg',
                                        ),
                                      )),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: screen.width -
                                              30.w -
                                              34.w -
                                              16.w -
                                              30.w -
                                              40.w,
                                          child: Text(
                                            'Promo 20% Semua Konseler',
                                            style: textTheme.bodyText1
                                                ?.copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screen.width -
                                              30.w -
                                              34.w -
                                              16.w -
                                              30.w -
                                              8.5.w,
                                          child: Text(
                                            'hanya berlaku sampai september 2022',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: textTheme.bodyText1
                                                ?.copyWith(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 22.h,
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
