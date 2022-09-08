import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tartan/utils/colours.dart';

import 'account_info_page.dart';
import 'favorite_page.dart';
import 'feed_page.dart';

class StructurePage extends StatefulWidget {
  const StructurePage({Key? key}) : super(key: key);

  @override
  State<StructurePage> createState() => _StructurePageState();
}

class _StructurePageState extends State<StructurePage> {
  int _selectedIndex = 0;
  final box = GetStorage();
  static final List<Widget> _tabWidget = <Widget>[
    FeedPage(),
    FavoritePage(),
    AccountInfoPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colurs.backgroundColor,
        body: Center(
          child: _tabWidget.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colurs.lightBlue,
                hoverColor: Colurs.lightBlue,
                tabBackgroundColor: Colurs.lightGreen,
                activeColor: Colurs.black,
                gap: 6,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                duration: const Duration(milliseconds: 400),
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Iconsax.home_2,
                    text: 'الرئيسية',
                  ),
                  GButton(
                    icon: Iconsax.heart,
                    text: 'المفضلة',
                  ),
                  GButton(
                    icon: Iconsax.frame_1,
                    text: 'الحساب',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
