import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
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
                CustomBox(title: '맞춤 문화재'),
                CustomBox(title: '이런 문화재는 어떠세요?'),
                CustomBox(title: '7월의 문화재'),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: '문화재',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}

class CustomBox extends StatelessWidget {
  final String title;

  CustomBox({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black),
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ImgBox(imgUrl: [
              'assets/sample1.jpg',
              'assets/sample2.jpg',
              'assets/sample3.jpg',
              'assets/sample4.jpg',
              'assets/sample5.jpg'
            ], names: [
              '경복궁',
              '덕수궁',
              '다보탑',
              '석가탑',
              '무구정광대다라니경'
            ])
          ],
        ));
  }
}

class ImgBox extends StatelessWidget {
  final List<String> imgUrl;
  final List<String> names;

  ImgBox({required this.imgUrl, required this.names});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.25;
    double containerWidth = MediaQuery.of(context).size.width * 0.4;

    return CarouselSlider(
      options: CarouselOptions(
        height: containerHeight,
        autoPlay: false, // 자동 슬라이더
        // aspectRatio: 16 / 9, // 가로 세로 비율 조정
        viewportFraction: 0.4, // 한 화면에 여러 개의 슬라이더가 보이도록 조정
        enableInfiniteScroll: false,
        padEnds: false, // 슬라이더 끝 여백 제거
      ),
      items: List.generate(names.length, (idx) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: containerWidth, // 기기 가로사이즈
              margin: EdgeInsets.symmetric(horizontal: 5.0), // 좌우여백
              // decoration: BoxDecoration(color: Colors.amber),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: containerWidth,
                      child : Image.asset(imgUrl[idx], fit: BoxFit.contain)
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: containerWidth,
                    child: Text(
                      names[idx],
                      style: TextStyle(fontSize: 16.0),
                      overflow: TextOverflow.ellipsis, // 텍스트 넘어가면 ...으로 표시
                    ),
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
