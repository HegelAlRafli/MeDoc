import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_doc/core/extensions/capitalize.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/pages/intro.dart';
import '../widgets/button_widget.dart';
import '../widgets/photo_profile_widget.dart';
import 'account.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'User';

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('token')!.toCapitalized();;
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.fromLTRB(28.w, 66.h, 28.w, 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/logo.svg'),
            SvgPicture.asset(
              'assets/icons/notification.svg',
              color: Colors.black,
            )
          ],
        ),
        SizedBox(height: 28.h),
        const PhotoProfile(),
        SizedBox(
          height: 40.h,
        ),
        Text(name, style: textTheme.headline4?.copyWith(fontSize: 16.sp)),
        Text('0289839839', style: textTheme.bodyText1),
        SizedBox(height: 40.h),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountPage(name: name),
                ));
          },
          child: const ButtonWidget(
            icon: 'account',
            title: 'Account',
          ),
        ),
        const ButtonWidget(
          icon: 'language',
          title: 'Language',
        ),
        const ButtonWidget(
          icon: 'faq_and_help',
          title: 'FAQ and Help',
        ),
        const ButtonWidget(
          icon: 'settings',
          title: 'Settings',
        ),
        InkWell(
          onTap: () async {
            _showDialog(context);
          },
          child: const ButtonWidget(
            icon: 'log_out',
            title: 'Log out',
          ),
        ),
      ]),
    );
  }
}

Future _showDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Keluar',
        style: TextStyle(fontSize: 14),
      ),
      content: const Text(
        'Apakah anda yakin ingin dari keluar akun',
        style: TextStyle(fontSize: 12),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tidak')),
        TextButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              await pref.clear();

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const IntroPage(),
                  ),
                  (route) => false);
            },
            child: const Text('iya'))
      ],
    ),
  );
}
