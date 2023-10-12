import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/color_value.dart';
import '../widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: ColorValue.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screen.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 56.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          size: 32.w,
                          color: Colors.white,
                        ),
                        Text(
                          'Daftar',
                          style: textTheme.headline4
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      'Masuk',
                      style: textTheme.headline1?.copyWith(fontSize: 30.sp),
                    ),
                    Text(
                        'Untuk lebih lanjut, silahkan masuk dengan akun anda. Jika kalian belum memiliki akun Me&Doc, silahkan daftar dan membuat akun.',
                        style:
                            textTheme.bodyText2?.copyWith(color: Colors.white)),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 543.h,
                width: screen.width,
                padding: EdgeInsets.only(top: 32.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r)),
                    color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextField(
                        controller: _usernameController,
                        hintText: 'Username',
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      SizedBox(height: 8.h),
                      Text('Lupa password?',
                          style: textTheme.bodyText2
                              ?.copyWith(color: ColorValue.primaryColor)),
                      Column(
                        children: [
                          Container(
                              height: 64.h,
                              margin: EdgeInsets.symmetric(vertical: 24.h),
                              decoration: BoxDecoration(
                                  color: ColorValue.secondaryColor,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Center(
                                child: Text(
                                  'Masuk',
                                  style: textTheme.headline1
                                      ?.copyWith(fontSize: 16.sp),
                                ),
                              )),
                          Container(
                              height: 64.h,
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              decoration: BoxDecoration(
                                  color: ColorValue.greyColor,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/google.svg'),
                                  Text(
                                    'Lanjut dengan Google',
                                    style: textTheme.bodyText2,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18.w,
                                  )
                                ],
                              )),
                          const SizedBox(height: 16),
                          Container(
                              height: 64.h,
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              decoration: BoxDecoration(
                                  color: ColorValue.greyColor,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/facebook.svg'),
                                  Text(
                                    'Lanjut dengan Facebook',
                                    style: textTheme.bodyText2,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18.w,
                                  )
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
