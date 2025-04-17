import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'cultural_heritage_page.dart';

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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            GestureDetector( // GestureDetector 추가
              onTap: () {
                Get.to(() => CulturalHeritagePage(title: title)); // Get 패키지를 사용한 페이지 전환
              },
              child: _ImgBox(names: names, imgUrl: imgSrc),
            ),
          ],
        ));
  }
}

class _ImgBox extends StatefulWidget  {
  final List<String> imgUrl;
  final List<String> names;

  _ImgBox({required this.names, required this.imgUrl});

  @override
  _ImgBoxState createState() => _ImgBoxState();
}

class _ImgBoxState extends State<_ImgBox> {
  int _currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.4;
    double containerWidth = MediaQuery.of(context).size.width * 0.65;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              items: List.generate(widget.names.length, (idx) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: containerWidth,
                      height: containerHeight,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: containerWidth,
                            height: containerHeight,
                            child: Image.asset(
                              widget.imgUrl[idx],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: containerWidth,
                            child: Text(
                              widget.names[idx],
                              style: TextStyle(fontSize: 16.0),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                );
              }),
              options: CarouselOptions(
                aspectRatio: containerWidth / containerHeight,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                padEnds: false,
                onPageChanged: (index, reason) {
                },
              ),
              // carouselController: _controller,
            ),
            Positioned(
              left: -12,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  carouselController.previousPage();
                },
              ),
            ),
            Positioned(
              right: -12,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  carouselController.nextPage();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

    // return Column(
    //   children: [
    //     CarouselSlider(
    //       options: CarouselOptions(
    //         // height: containerHeight,
    //         // autoPlay: false, // 자동 슬라이더
    //         aspectRatio: 16 / 9, // 가로 세로 비율 조정
    //         viewportFraction: 1,
    //         enableInfiniteScroll: false,
    //         padEnds: false, // 슬라이더 끝 여백 제거
    //       ),
    //       items: List.generate(widget.names.length, (idx) {
    //         return Builder(
    //           builder: (BuildContext context) {
    //             return Container(
    //               // width: double.infinity,
    //               // width: containerWidth, // 기기 가로사이즈
    //               // height: containerHeight,
    //               margin: EdgeInsets.symmetric(horizontal: 5.0), // 좌우여백
    //               // decoration: BoxDecoration(color: Colors.amber),
    //               child:
    //               // DataGroupingBox(title:names[idx]),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                     // width: containerWidth,
    //                       child: Image.asset(imgUrl[idx], fit: BoxFit.cover)),
    //                   SizedBox(height: 5),
    //                   Container(
    //                     // width: containerWidth,
    //                     child: Text(
    //                       names[idx],
    //                       style: TextStyle(fontSize: 16.0),
    //                       overflow: TextOverflow.ellipsis, // 텍스트 넘어가면 ...으로 표시
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             );
    //           },
    //         );
    //       }).toList(),
    //     ),
    //   ],
    // );
