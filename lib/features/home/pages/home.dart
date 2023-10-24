import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_doc/core/extensions/capitalize.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/color_value.dart';
import '../../notification/pages/notification.dart';
import '../widgets/consul_widget.dart';
import '../widgets/customtitle_widget.dart';
import '../widgets/expression_widget.dart';
import '../widgets/meditation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = 'User';

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('token')!.toCapitalized();;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 22.h,
            ),
            _header(),
            SizedBox(
              height: 16.h,
            ),
            _expression(),
            SizedBox(
              height: 16.h,
            ),
            _body(),
          ],
        ),
      )),
    );
  }

  Widget _header() {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(left: 28.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Pagi, $name",
                style: textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "Bagaimana Perasaanmu hari ini ?",
                style: textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ));
            },
            child: Container(
                height: 52.h,
                width: 52.w,
                decoration:  BoxDecoration(
                    color: ColorValue.primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r))),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/notification.svg",
                    height: 24.h,
                    width: 24.w,
                  ),

                )),
          )
        ],
      ),
    );
  }

  Widget _expression() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          expressionWidget("assets/icons/expression1.svg", "Senang", 0xffEF5DA8,
              Container(), context),
          expressionWidget("assets/icons/expression2.svg", "Biasa", 0xffC7F466,
              Container(), context),
          expressionWidget("assets/icons/expression3.svg", "Sedih", 0xff4DCCC1,
              Container(), context),
          expressionWidget("assets/icons/expression4.svg", "Marah", 0xffFF696B,
              Container(), context)
        ],
      ),
    );
  }

  Widget _body() {
    List img = [
      "assets/illustrations/meditation1.png",
      "assets/illustrations/meditation2.png",
      "assets/illustrations/meditation3.png",
    ];
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mengatasi Gangguan Kesehatan Mental",
                    style: textTheme.headline4),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      consulWidget(
                          "Konsultasi", "assets/icons/mental1.png", context),
                      consulWidget(
                          "Artikel", "assets/icons/meditation.png", context),
                      consulWidget("Bubble Breathe", "assets/icons/breathe.png",
                          context),
                      consulWidget("Tips", "assets/icons/tips.png", context),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                customTitleWidget(
                    "Tentang Kesehatan Mental",
                    "Edukasi tentang kesehatan mental",
                    "assets/icons/info.svg",
                    context),
                SizedBox(
                  height: 16.h,
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 28.w, vertical: 25.h),
                      width: MediaQuery.of(context).size.width,
                      height: 136.h,
                      decoration: BoxDecoration(
                        color: ColorValue.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45.w -
                                28.w * 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Kesehatan Mental ?",
                                style: textTheme.headline4?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.white),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.45.w -
                                        28.w,
                                child: Text(
                                  "Cari tau tentang pentingnya kesehatan mental",
                                  style: textTheme.headline5?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 8.h),
                                    child: Text(
                                      "Cari Tau ! ",
                                      style: textTheme.headline5?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: ColorValue.primaryColor),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -60.h,
                      left: -40.w,
                      child: Container(
                        height: 158.h,
                        width: 158.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffCBCBCB).withOpacity(0.4)),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Image.asset(
                        "assets/icons/mental5.png",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                customTitleWidget(
                    "Rekomendasi Meditasi",
                    "Beberapa Meditasi berdasarkan suasana hatimu saat ini",
                    "assets/icons/medit.svg",
                    context),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          Container(
            height: 180.h,
            margin: EdgeInsets.zero,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              padding: EdgeInsets.only(left: 28.w),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16.w),
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          color: const Color(0xffF3F6F6),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Image.asset(
                          img[index],
                          height: 85.h,
                          width: 85.w,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Container(
                      width: 120.w,
                      child: Text(
                        "Hilangkan Overthingking ${index + 1}",
                        style: textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                customTitleWidget(
                    "Selesaikan Meditasi",
                    "lanjutkan meditasi yang belum selesai",
                    "assets/icons/medit.svg",
                    context),
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
          meditationWidget(context, "assets/illustrations/medit4.png",
              "Menerima Diri", "Durasi Sesi 24 Menit", 0xff4DCCC1),
          SizedBox(
            height: 8.h,
          ),
          meditationWidget(context, "assets/illustrations/medit5.png",
              "Berhenti Overthinking", "Durasi Sesi 40 Menit", 0xffF385BD),
          SizedBox(
            height: 8.h,
          ),
          meditationWidget(context, "assets/illustrations/medit6.png",
              "Menerima Diri", "Durasi Sesi 38 Menit", 0xff4DCCC1),
          SizedBox(
            height: 24.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              children: [
                customTitleWidget(
                    "Artikel",
                    "Artikel mengenai kesehatan mental",
                    "assets/icons/article.svg",
                    context),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 158.h,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.only(right: 16.w),
                      height: 100.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset("assets/illustrations/artikel.png"),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text("Apa itu Kesehatan Mental ${index + 1}",
                        style: textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        )),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
