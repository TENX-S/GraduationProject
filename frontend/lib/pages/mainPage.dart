import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import '../utils/tip.dart';
import '../utils/styles.dart';
import './pages.dart';

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
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            HomePage(),
            PostPage(),
            UserPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: false,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        backgroundColor: Colors.white38,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        },
        items: [
          BottomNavyBarItem(
            title: const Text('首页'),
            icon: const Icon(Icons.home_outlined),
            textAlign: TextAlign.center,
            activeColor: AppColor.active,
            inactiveColor: AppColor.inactive,
          ),
          BottomNavyBarItem(
            title: const Text('藏品'),
            icon: const Icon(Icons.collections_outlined),
            textAlign: TextAlign.center,
            activeColor: AppColor.active,
            inactiveColor: AppColor.inactive,
          ),
          BottomNavyBarItem(
            title: const Text('我的'),
            icon: const Icon(Icons.people_outlined),
            textAlign: TextAlign.center,
            activeColor: AppColor.active,
            inactiveColor: AppColor.inactive,
          ),
        ],
      ),
    );
  }
}
