// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/bottom_navigation/bottom_navigation.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.isRegister = false,
    required this.auth,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final bool isRegister;
  final String auth;
  final TextEditingController usernameController, passwordController, confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        InkWell(
          onTap: () async {
            if (usernameController.text.isEmpty ||
                passwordController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Isi semua kolom terlebih dahulu")));
            } else if (isRegister) {
              if (passwordController.text != confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("konfirmasi password anda dengan benar")));
              } else {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString('token', usernameController.text);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigation(),
                    ),
                    (route) => false);
              }
            } else {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString('token', usernameController.text);

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigation(),
                  ),
                  (route) => false);
            }
          },
          child: Container(
              height: 64.h,
              margin: EdgeInsets.symmetric(vertical: 24.h),
              decoration: BoxDecoration(
                  color: ColorValue.secondaryColor,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Center(
                child: Text(
                  auth,
                  style: textTheme.headline1?.copyWith(fontSize: 16.sp),
                ),
              )),
        ),
        InkWell(
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('token', 'Arjuna');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                ),
                (route) => false);
          },
          child: Container(
              height: 64.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                  color: ColorValue.greyColor,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        SizedBox(height: 16.h),
        InkWell(
          onTap: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.setString('token', 'Arjuna');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                ),
                (route) => false);
          },
          child: Container(
              height: 64.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                  color: ColorValue.greyColor,
                  borderRadius: BorderRadius.circular(50.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              )),
        )
      ],
    );
  }
}
