import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screen.dart';
import '../common/styles.dart';
import '../common/tip.dart';
import '../models/user.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  DateTime? currentBackPressTime;

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showTip(msg: '再按一次返回键退出');
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: ChangeNotifierProvider(
          create: (context) => currUser,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: const <Widget>[
              HomePage(),
              CollPage(),
              UserPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: 28,
        itemCornerRadius: 10,
        containerHeight: 60,
        showElevation: false,
        backgroundColor: AppColor.btmNavBarBg,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 150),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavyBarItem(
            title: const Text('首页'),
            icon: const Icon(Icons.home_outlined),
            textAlign: TextAlign.center,
            activeColor: AppColor.btmNavBarActive,
            inactiveColor: AppColor.btmNavBarInactive,
          ),
          BottomNavyBarItem(
            title: const Text('藏品'),
            icon: const Icon(Icons.collections_outlined),
            textAlign: TextAlign.center,
            activeColor: AppColor.btmNavBarActive,
            inactiveColor: AppColor.btmNavBarInactive,
          ),
          BottomNavyBarItem(
            title: const Text('我的'),
            icon: const Icon(Icons.people_outlined),
            textAlign: TextAlign.center,
            activeColor: AppColor.btmNavBarActive,
            inactiveColor: AppColor.btmNavBarInactive,
          ),
        ],
      ),
    );
  }
}
