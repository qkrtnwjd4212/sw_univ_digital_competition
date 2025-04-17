import 'package:docent/commons/HeritageBox.dart';
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
              SizedBox(height: height * 0.01,),
              Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.25,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  'https://img.khan.co.kr/news/2015/03/24/l_2015032501003866400310141.jpg',
                                  fit: BoxFit.cover,
                                  width: width * 0.25,
                                  height: 90,
                                )
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // 좋아요 로직 추가
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '경복궁 경회루',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 17,
                                    color: colorPallet.light_green,
                                  ),
                                  SizedBox(width: 5), // 아이콘과 텍스트 사이에 약간의 간격 추가
                                  Expanded(
                                    child: Text(
                                      '서울특별시 종로구 사직로 161 (세종로, 경복궁)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffC3C3C3),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffC3C3C3),
                      thickness: 1,
                      height: 20,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.25,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://i.namu.wiki/i/zpqQTS8IhybFCtNnOOXhIt8E0f2Bfr4qtyKCv5nTXaGkp8kSsIQBxq4-oJWyqUYAf3gYaLkr6ayUmMClXvBMWA.webp',
                                    fit: BoxFit.cover,
                                    width: width * 0.25,
                                    height: 90,
                                  )
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // 좋아요 로직 추가
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '합천 해인사 대장경판',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 17,
                                    color: colorPallet.light_green,
                                  ),
                                  SizedBox(width: 5), // 아이콘과 텍스트 사이에 약간의 간격 추가
                                  Expanded(
                                    child: Text(
                                      '경남 합천군 가야면 해인사길 122, 해인사 (치인리)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffC3C3C3),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffC3C3C3),
                      thickness: 1,
                      height: 20,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width * 0.25,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://www.yeongnam.com/mnt/file/201204/20120402.010310721200001i1.jpg',
                                    fit: BoxFit.cover,
                                    width: width * 0.25,
                                    height: 90,
                                  )
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    // 좋아요 로직 추가
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.favorite_rounded,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '청자 기린형뚜껑 향로',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 17,
                                    color: colorPallet.light_green,
                                  ),
                                  SizedBox(width: 5), // 아이콘과 텍스트 사이에 약간의 간격 추가
                                  Expanded(
                                    child: Text(
                                      '서울특별시 성북구 성북로 102-11',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffC3C3C3),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffC3C3C3),
                      thickness: 1,
                      height: 20,
                    ),

                  ],
                ),
              )
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
