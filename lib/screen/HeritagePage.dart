import 'package:flutter/material.dart';

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

      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
