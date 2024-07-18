import 'package:flutter/material.dart';
import '../../commons/BottomBar.dart';
import '../../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('마이페이지', style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10), // 모서리를 10만큼 둥글게 설정
                    child: Image.network(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover, // 이미지를 컨테이너 크기에 맞게 조정
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Text('전주은님', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    ),),
                  ),
                  SizedBox(
                    width: 75,
                    height: 35,
                    child: TextButton(onPressed: () {

                    }, style: TextButton.styleFrom(
                      backgroundColor: colorPallet.deep_green, // 버튼 배경색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                        child: Text(
                      '회원 정보', style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                    )),
                  )

                ],
              ),
              SizedBox(height: 20,),
              Divider(
                color: Color(0xffD9D9D9),
                thickness: 1,
                height: 10,
              ),
              TextButton(onPressed: () {

              }, child: Text('좋아요 한 문화재', style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.normal
              ),),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // 상하좌우 패딩 제거
                  splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
                  backgroundColor: Colors.transparent, // 배경색 투명
                  foregroundColor: Colors.transparent, // 클릭 시 오버레이 색상 투명
                ),
              ),
              Divider(
                color: Color(0xffD9D9D9),
                thickness: 1,
                height: 10,
              ),

              TextButton(onPressed: () {

              }, child: Text('다운로드한 컨텐츠', style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
              ),),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // 상하좌우 패딩 제거
                  splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
                  backgroundColor: Colors.transparent, // 배경색 투명
                  foregroundColor: Colors.transparent, // 클릭 시 오버레이 색상 투명
                ),
              ),
              Divider(
                color: Color(0xffD9D9D9),
                thickness: 1,
                height: 10,
              ),

              TextButton(onPressed: () {

              }, child: Text('방문한 문화재', style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
              ),),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // 상하좌우 패딩 제거
                  splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
                  backgroundColor: Colors.transparent, // 배경색 투명
                  foregroundColor: Colors.transparent, // 클릭 시 오버레이 색상 투명
                ),
              ),
              Divider(
                color: Color(0xffD9D9D9),
                thickness: 1,
                height: 10,
              ),

              TextButton(onPressed: () {

              }, child: Text('작성한 댓글', style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
              ),),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // 상하좌우 패딩 제거
                  splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
                  backgroundColor: Colors.transparent, // 배경색 투명
                  foregroundColor: Colors.transparent, // 클릭 시 오버레이 색상 투명
                ),
              ),
              Divider(
                color: Color(0xffD9D9D9),
                thickness: 1,
                height: 10,
              ),

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
