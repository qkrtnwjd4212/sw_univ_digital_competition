import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../commons/BottomBar.dart';

class HeritagePage extends StatefulWidget {
  const HeritagePage({super.key});

  @override
  State<HeritagePage> createState() => _HeritagePageState();
}

class _HeritagePageState extends State<HeritagePage> {

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: NaverMap(
              options: NaverMapViewOptions(),
              onMapReady: (controller) {
                print('네이버 맵 로딩됨!');
              },
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
