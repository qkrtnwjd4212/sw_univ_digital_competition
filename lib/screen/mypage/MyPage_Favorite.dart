import 'package:flutter/material.dart';
import '../../commons/BottomBar.dart';
import '../../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MypageFavorite extends StatefulWidget {
  const MypageFavorite({super.key});

  @override
  State<MypageFavorite> createState() => _MypageFavoriteState();
}

class _MypageFavoriteState extends State<MypageFavorite> {
  final ColorPallet colorPallet = ColorPallet();

  // 하단바 컨트롤
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('좋아요 한 문화재', style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600
        ),),
      ),
      body: Center(
        child: Container(
          width: width * 0.9,
          child: Column(
            children: [

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
