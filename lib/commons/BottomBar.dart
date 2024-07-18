import 'package:docent/screen/Heritage/HeritagePage.dart';
import 'package:docent/screen/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screen/mypage/MyPage.dart';
import 'color_pallet.dart';


class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  BottomBar({required this.currentIndex, required this.onTap});

  final ColorPallet colorPallet = ColorPallet();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: colorPallet.light_green,
        selectedItemColor: colorPallet.deep_green,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildBottomNavigationBarItem(
              label: '홈',
              isSelected: currentIndex == 0,
              tappedIcon: 'lib/assets/icons/home_select.png',
              untappedIcon: 'lib/assets/icons/home.png'
          ),
          _buildBottomNavigationBarItem(
              label: '문화재',
              isSelected: currentIndex == 1,
              tappedIcon: 'lib/assets/icons/heritage_select.png',
              untappedIcon: 'lib/assets/icons/heritage.png'
          ),
          _buildBottomNavigationBarItem(
              label: '마이',
              isSelected: currentIndex == 2,
              tappedIcon: 'lib/assets/icons/my_select.png',
              untappedIcon: 'lib/assets/icons/my.png'
          ),

        ]
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String label,
    required bool isSelected,
    required String tappedIcon,
    required String untappedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected
          ? Image.asset(
        tappedIcon,
        height: 38,
      )
          : Image.asset(
        untappedIcon,
        height: 38,
      ),
      label: label
    );
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Get.to(HomePage());
    } else if (index == 1) {
      Get.to(HeritagePage());
    } else if (index == 2) {
      Get.to(MyPage());
    } else {
      onTap(index);
    }
  }

}
