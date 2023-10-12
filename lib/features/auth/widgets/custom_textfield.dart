import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required TextEditingController controller, required this.hintText}) : _controller = controller;

  final String hintText;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
          color: ColorValue.greyColor,
          borderRadius: BorderRadius.circular(50.r)),
      child: Center(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
