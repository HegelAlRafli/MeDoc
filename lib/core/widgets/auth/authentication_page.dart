import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/auth/pages/intro.dart';
import '../bottom_navigation/bottom_navigation.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  Future _initialize() async {
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString('token');

    if (mounted) {
      if (token == null) {
        _navigate(child: const IntroPage());
      } else {
        _navigate(child: const BottomNavigation());
      }
    }
  }

  void _navigate({required Widget child}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: child,
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(color: Colors.transparent),
      ),
    );
  }
}
