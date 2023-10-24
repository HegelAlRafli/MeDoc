import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../features/explore/pages/explore.dart';
import '../../../features/home/pages/home.dart';
import '../../../features/profile/pages/profile.dart';
import '../../theme/color_value.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  late final PageController _controller;

  final _tabs = [
    const HomePage(),
    const ExplorePage(),
    const Center(
      child: Text('nanti disini page'),
    ),
    const Center(
      child: Text('nanti disini page'),
    ),
    const ProfilePage(),
  ];

  final _items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/botnav_icons/home.svg'),
      activeIcon: SvgPicture.asset(
        'assets/icons/botnav_icons/home.svg',
        color: ColorValue.primaryColor,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/botnav_icons/explore.svg'),
      activeIcon: SvgPicture.asset(
        'assets/icons/botnav_icons/explore.svg',
        color: ColorValue.primaryColor,
      ),
      label: 'Explore',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/botnav_icons/statistic.svg'),
      activeIcon: SvgPicture.asset(
        'assets/icons/botnav_icons/statistic.svg',
        color: ColorValue.primaryColor,
      ),
      label: 'Stats',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/botnav_icons/consultation.svg'),
      activeIcon: SvgPicture.asset(
        'assets/icons/botnav_icons/consultation.svg',
        color: ColorValue.primaryColor,
      ),
      label: 'Consul',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/botnav_icons/profile.svg'),
      activeIcon: SvgPicture.asset(
        'assets/icons/botnav_icons/profile.svg',
        color: ColorValue.primaryColor,
      ),
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: ColorValue.primaryColor,
        unselectedItemColor: const Color(0xFFB8EBE6),
        selectedLabelStyle: textTheme.bodyText2,
        unselectedLabelStyle: textTheme.bodyText2,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 5,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
