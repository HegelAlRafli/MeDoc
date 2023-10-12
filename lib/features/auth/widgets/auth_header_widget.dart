import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/intro.dart';
import '../pages/login.dart';
import '../pages/register.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key, required this.auth});

  final String auth;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 56.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IntroPage(),
                      ));
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 32.w,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => auth == 'Masuk'
                            ? const RegisterPage()
                            : const LoginPage(),
                      ));
                },
                child: Text(
                  auth == 'Masuk' ? 'Daftar' : 'Masuk',
                  style: textTheme.headline4?.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(height: 32.h),
          Text(
            auth,
            style: textTheme.headline1?.copyWith(fontSize: 30.sp),
          ),
          Text(
              'Untuk lebih lanjut, silahkan masuk dengan akun anda. Jika kalian belum memiliki akun Me&Doc, silahkan daftar dan membuat akun.',
              style: textTheme.bodyText2?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
