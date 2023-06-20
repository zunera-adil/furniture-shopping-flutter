import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/generated/assets/icons.dart';
import 'package:furniture_shopping_flutter/view/favorite/favorite_screen.dart';
import 'package:furniture_shopping_flutter/view/home/home_page.dart';
import 'package:furniture_shopping_flutter/view/notification/notification_screen.dart';
import 'package:furniture_shopping_flutter/view/profile/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;
  final List<Widget> _childrenPage = [
    const HomePage(),
    FavouriteScreen(),
    NotificationScreen(),
    const ProfileScreen(),
  ];

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
    final theme = Theme.of(context);
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _childrenPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(_currentIndex);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Image.asset(
                AssetsIcon.homeOutlineIcon,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                AssetsIcon.homeFilledIcon,
                width: 24.w,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                AssetsIcon.favoriteOutlineIcon,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                AssetsIcon.favoriteFilledIcon,
                width: 24.w,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                AssetsIcon.bellOutlineIcon,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                AssetsIcon.bellFilledIcon,
                width: 24.w,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                AssetsIcon.personOutlineIcon,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                AssetsIcon.personFilledIcon,
                width: 24.w,
              ),
              label: ''),
        ],
      ),
    );
  }
}
