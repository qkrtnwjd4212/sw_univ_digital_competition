import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:docent/commons/BottomBar.dart';
import 'package:get/get.dart';

import 'custom_carousel.dart';
import 'custom_month_carousel.dart';
import 'data_grouping_box.dart';
import 'cultural_heritage_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이도슨트'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomBox(title: '맞춤 문화재', names: [
                  '경회루',
                  '덕수궁',
                  '근정전'
                ], imgSrc: [
                  'lib/assets/images/경회루.jpg',
                  'lib/assets/images/덕수궁.jpg',
                  'lib/assets/images/근정전.jpg'
                ]),
                CustomBox(title: '이런 문화재는 어떠세요?', names: [
                  '다보탑',
                  '석굴암',
                  '성덕대왕신종'
                ], imgSrc: [
                  'lib/assets/images/다보탑.jpg',
                  'lib/assets/images/sample1.jpg',
                  'lib/assets/images/성덕대왕신종.jpg'
                ]),
                GestureDetector(
                  onTap: () {
                    Get.to(() => CulturalHeritagePage(title: '7월의 문화재'));
                  },
                  child: CustomMonthBox(title: '7월의 문화재', names: [
                    '7월 19일 - 백제 멸망',
                    '7월 20일 - 무슨날',
                    '7월 21일 - 어떤날',
                  ], imgSrc: [
                    'lib/assets/images/백제_금동대향로.jpg',
                    'lib/assets/images/sample2.jpg',
                    'lib/assets/images/sample1.jpg'
                  ]),
                ),
                // CustomMonthBox(title: '7월의 문화재', names: [
                //   '7월 19일 - 백제 멸망',
                //   '7월 20일 - 무슨날',
                //   '7월 21일 - 어떤날',
                // ], imgSrc: [
                //   'lib/assets/images/sample3.jpg',
                //   'lib/assets/images/sample2.jpg',
                //   'lib/assets/images/sample1.jpg'
                // ]),
              ],
            ),
          )),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}