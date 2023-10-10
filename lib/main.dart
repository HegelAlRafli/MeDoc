import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:me_doc/features/auth/pages/intro.dart';

import 'core/theme/app_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Me Doc',
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getThemeLight(),
          home: child,
        );
      },
      child: const IntroPage(),
    );
  }
}
