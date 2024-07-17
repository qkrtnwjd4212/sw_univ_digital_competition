import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomMonthBox extends StatelessWidget {
  final String title;
  final List<String> names;
  final List<String> imgSrc;

  CustomMonthBox({required this.title, required this.names, required this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _ImgBox(names: names, imgUrl: imgSrc)
          ],
        ));
  }
}

class _ImgBox extends StatelessWidget {
  final List<String> imgUrl;
  final List<String> names;

  _ImgBox({required this.names, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.25;
    double containerWidth = MediaQuery.of(context).size.width * 0.4;

    return CarouselSlider(
      options: CarouselOptions(
        height: containerHeight,
        autoPlay: false,
        // 자동 슬라이더
        aspectRatio: 16 / 9,
        // 가로 세로 비율 조정
        viewportFraction: 0.4,
        // 한 화면에 여러 개의 슬라이더가 보이도록 조정
        enableInfiniteScroll: false,
        padEnds: false, // 슬라이더 끝 여백 제거
      ),
      items: List.generate(names.length, (idx) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: containerWidth, // 기기 가로사이즈
              height: containerHeight,
              margin: EdgeInsets.symmetric(horizontal: 5.0), // 좌우여백
              // decoration: BoxDecoration(color: Colors.amber),
              child:
              // DataGroupingBox(title:names[idx]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: containerWidth,
                      child: Image.asset(imgUrl[idx], fit: BoxFit.contain)),
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