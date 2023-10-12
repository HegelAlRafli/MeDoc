import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../widgets/auth_button_widget.dart';
import '../widgets/auth_header_widget.dart';
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
              const HeaderAuth(auth: 'Masuk'),
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
                        isPassword: true,
                      ),
                      SizedBox(height: 8.h),
                      Text('Lupa password?',
                          style: textTheme.bodyText2
                              ?.copyWith(color: ColorValue.primaryColor)),
                      AuthButton(
                        auth: 'Masuk',
                        usernameController: _usernameController,
                        passwordController: _passwordController,
                        confirmPasswordController: _passwordController,
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
