import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/validator/input_validator.dart';
import '../widgets/photo_profile_widget.dart';
import '../widgets/widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.name});

  final String name;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.name;
    _emailController.text = '${widget.name}@gmail.com';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewPadding.top * 2 -
              MediaQuery.of(context).padding.bottom,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const PhotoProfile(),
                    SizedBox(height: 40.h),
                    customTextField(
                        context,
                        'Nama Lengkap',
                        widget.name,
                        (value) => InputValidator().emptyValidator(value),
                        _nameController),
                    SizedBox(height: 16.h),
                    customTextField(
                        context,
                        'Alamat Email',
                        '${widget.name.toLowerCase()}@gmail.com',
                        (value) => InputValidator().emailValidator(value),
                        _emailController),
                    SizedBox(height: 16.h),
                    customDropDown(context, 'Gender', 'Laki - Laki'),
                    SizedBox(height: 16.h),
                    customCalendar(
                        context, 'Tanggal Lahir', '12 September 2022'),
                    SizedBox(height: 16.h),
                    customDropDown(context, 'Negara', 'Indonesia'),
                    SizedBox(height: 16.h),
                    customPhoneTextField(context, 'Nomer HandPhone', '+62'),
                  ],
                ),
              ),
              buttonSave(context, _nameController)
            ],
          ),
        ),
      ),
    );
  }
}
