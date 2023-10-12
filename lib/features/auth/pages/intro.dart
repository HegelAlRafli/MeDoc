import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import 'login.dart';
import 'register.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 151.r),
        Image.asset(
          'assets/icons/logo.png',
          width: 177.w,
          height: 177.h,
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 53.h),
          height: 328.h,
          width: screen.width,
          decoration: BoxDecoration(
              color: ColorValue.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang',
                style: textTheme.headline1?.copyWith(fontSize: 30.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                'Untuk lebih lanjut, silahkan masuk dengan akun anda. Jika kalian belum memiliki akun Me&Doc,silahkan daftar dan membuat akun.',
                style: textTheme.bodyText2?.copyWith(color: Colors.white),
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                    child: Container(
                      height: 65.h,
                      width: 148.w,
                      decoration: BoxDecoration(
                          color: ColorValue.secondaryColor,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Center(
                        child: Text(
                          'Masuk',
                          style: textTheme.headline1?.copyWith(fontSize: 16.sp),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ));
                    },
                    child: Container(
                      height: 65.h,
                      width: 148.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Center(
                        child: Text(
                          'Daftar',
                          style: textTheme.headline1?.copyWith(
                              fontSize: 16.sp,
                              color: ColorValue.secondaryColor),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
