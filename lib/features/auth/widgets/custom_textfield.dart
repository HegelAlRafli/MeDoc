import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    this.isPassword = false,
  }) : _controller = controller;

  final String hintText;
  final TextEditingController _controller;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordNotVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.only(left: 24.w, right: 16.w),
      decoration: BoxDecoration(
          color: ColorValue.greyColor,
          borderRadius: BorderRadius.circular(50.r)),
      child: Center(
        child: TextField(
          obscureText: widget.isPassword ? _isPasswordNotVisible : false,
          controller: widget._controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            suffixIcon: widget.isPassword
                ? IconButton(
                    splashRadius: 30.w,
                    onPressed: () {
                      setState(() {
                        _isPasswordNotVisible = !_isPasswordNotVisible;
                      });
                    },
                    icon: _isPasswordNotVisible
                        ? const Icon(
                            Icons.visibility_off,
                            color: ColorValue.greyTextColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: ColorValue.greyTextColor,
                          ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
