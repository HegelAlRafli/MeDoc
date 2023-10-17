import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/bottom_navigation/bottom_navigation.dart';

Widget customTextField(
    BuildContext context,
    final String title,
    initialValue,
    final String? Function(String?)? validator,
    TextEditingController controller) {
  final textTheme = Theme.of(context).textTheme;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: textTheme.bodyText1?.copyWith(
              fontSize: 10.sp, color: ColorValue.secondarygreyTextColor)),
      TextFormField(
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorValue.greyTextColor),
            ),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8.h)),
        controller: controller,
        maxLines: 1,
        style: textTheme.bodyText2?.copyWith(color: Colors.black),
        // initialValue: initialValue,
        validator: validator,
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    ],
  );
}

Widget customDropDown(BuildContext context, final String title, initialValue) {
  final textTheme = Theme.of(context).textTheme;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: textTheme.bodyText1?.copyWith(
              fontSize: 10.sp, color: ColorValue.secondarygreyTextColor)),
      SizedBox(height: 8.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            initialValue,
            style: textTheme.bodyText2?.copyWith(color: Colors.black),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ColorValue.primaryColor,
          )
        ],
      ),
      SizedBox(height: 8.h),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Divider(
          height: 0,
          thickness: 0.5.h,
          color: ColorValue.greyTextColor,
        ),
      ),
    ],
  );
}

Widget customCalendar(BuildContext context, final String title, initialValue) {
  final textTheme = Theme.of(context).textTheme;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: textTheme.bodyText1?.copyWith(
              fontSize: 10.sp, color: ColorValue.secondarygreyTextColor)),
      SizedBox(height: 8.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            initialValue,
            style: textTheme.bodyText2?.copyWith(color: Colors.black),
          ),
          Image.asset('assets/icons/calendar.png')
        ],
      ),
      SizedBox(height: 8.h),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Divider(
          height: 0,
          thickness: 0.5.h,
          color: ColorValue.greyTextColor,
        ),
      ),
    ],
  );
}

Widget customPhoneTextField(
    BuildContext context, final String title, initialValue) {
  final textTheme = Theme.of(context).textTheme;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: textTheme.bodyText1?.copyWith(
              fontSize: 10.sp, color: ColorValue.secondarygreyTextColor)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: 102.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      initialValue,
                      style: textTheme.bodyText2?.copyWith(color: Colors.black),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: ColorValue.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Divider(
                    height: 0,
                    thickness: 0.5.h,
                    color: ColorValue.greyTextColor,
                  ),
                ),
              ],
            ),
          ),
          // TextFormField()
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nomer HP'),
              SizedBox(height: 5.h),
              Container(
                height: 0.5.h,
                width: 178.w,
                color: ColorValue.greyTextColor,
              )
            ],
          )
        ],
      ),
    ],
  );
}

Widget buttonSave(BuildContext context, TextEditingController controller) {
  final textTheme = Theme.of(context).textTheme;

  return InkWell(
    onTap: () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('token', controller.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavigation()));
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 72.h,
      color: ColorValue.primaryColor,
      child: Center(
          child: Text(
        'Simpan Perubahan',
        style: textTheme.headline1,
      )),
    ),
  );
}
