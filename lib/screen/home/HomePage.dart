import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:docent/commons/BottomBar.dart';

import 'custom_carousel.dart';
import 'custom_month_carousel.dart';
import 'data_grouping_box.dart';

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
                  '숭례문',
                  '근정전'
                ], imgSrc: [
                  'lib/assets/images/sample1.jpg',
                  'lib/assets/images/sample2.jpg',
                  'lib/assets/images/sample3.jpg'
                ]),
                CustomBox(title: '이런 문화재는 어떠세요?', names: [
                  '다보탑',
                  '석굴암',
                  '성덕대왕신종'
                ], imgSrc: [
                  'lib/assets/images/sample1.jpg',
                  'lib/assets/images/sample2.jpg',
                  'lib/assets/images/sample3.jpg'
                ]),
                CustomMonthBox(title: '7월의 문화재', names: [
                  '7월 19일 - 백제 멸망',
                ], imgSrc: [
                  'lib/assets/images/sample1.jpg',
                ]),
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


// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('마이도슨트'),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 CustomBox(title: '맞춤 문화재', names: [
//                   '경회루',
//                   '숭례문',
//                   '근정전'
//                 ], imgSrc: [
//                   'lib/assets/images/sample1.jpg',
//                   'lib/assets/images/sample2.jpg',
//                   'lib/assets/images/sample3.jpg'
//                 ]),
//                 CustomBox(title: '이런 문화재는 어떠세요?', names: [
//                   '다보탑',
//                   '석굴암',
//                   '성덕대왕신종'
//                 ], imgSrc: [
//                   'lib/assets/images/sample1.jpg',
//                   'lib/assets/images/sample2.jpg',
//                   'lib/assets/images/sample3.jpg'
//                 ]),
//                 CustomMonthBox(title: '7월의 문화재', names: [
//                   '7월 19일 - 백제 멸망',
//                 ], imgSrc: [
//                   'lib/assets/images/sample1.jpg',
//                 ]),
//               ],
//             ),
//           )),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: '홈',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.art_track),
//             label: '문화재',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: '마이페이지',
//           ),
//         ],
//       ),
//     );
//   }
// }
