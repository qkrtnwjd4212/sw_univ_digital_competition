import 'package:flutter/material.dart';
import '../../commons/BottomBar.dart';
import '../../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyPageMemberInfo extends StatefulWidget {
  const MyPageMemberInfo({super.key});

  @override
  State<MyPageMemberInfo> createState() => _MyPageMemberInfoState();
}

class _MyPageMemberInfoState extends State<MyPageMemberInfo> {
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
        title: Text('회원 정보', style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
      ),
      body: Center(
        child: Container(
          width: width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  Container(
                    color: Color(0xffF4F4F4), // 연한 회색 배경색 설정
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '전주은', // 힌트 텍스트 설정
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black, // 텍스트 색상 설정
                        ),
                        border: InputBorder.none, // 외곽선 없애기
                      ),
                    ),
                  )


                ],
              ),
              SizedBox(height: 20,),
              Divider(
                color: Color(0xffD9D9D9),
                thickness: 1,
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('나의 관심사', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
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
                          '추가', style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        )),
                  )
                ],
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
