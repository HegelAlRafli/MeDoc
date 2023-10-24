import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:me_doc/core/extensions/capitalize.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/color_value.dart';
import '../../notification/pages/notification.dart';
import '../widgets/explore_content_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String name = 'User';

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('token')!.toCapitalized();
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: ColorValue.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w),
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi, $name', style: textTheme.headline1),
                          Text(formattedDate,
                              style: textTheme.bodyText2?.copyWith(color: Colors.white))
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NotificationPage(),
                              ));
                        },
                        child: SvgPicture.asset('assets/icons/notification.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 24.w,),
                    decoration: BoxDecoration(
                        color: ColorValue.greyColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: const TextField(
                      style: TextStyle(color: ColorValue.greyTextColor),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Color(0xFFA6A6A6)),
                          hintText: 'Search',
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.search_rounded,
                            color: Color(0xFFA6A6A6),
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24.h),
            const ExploreContentWidget()
          ],
        ),
      ),
    );
  }
}
