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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF4F4F4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.only(left: 10),
                      child: TextFormField(
                        cursorColor: colorPallet.deep_green,
                        decoration: InputDecoration(
                          hintText: '박수정', // 힌트 텍스트 설정
                          hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black, // 텍스트 색상 설정
                          ),
                          border: InputBorder.none, // 외곽선 없애기
                        ),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('나의 관심사', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(
                    width: 70,
                    height: 35,
                    child: TextButton(onPressed: () {

                    }, style: TextButton.styleFrom(
                      backgroundColor: colorPallet.deep_green, // 버튼 배경색 설정
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0)
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
              SizedBox(height: 15),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때의 동작
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: colorPallet.light_green, // 버튼 배경색 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 5만큼 둥글게
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8), // 내부 패딩 조정
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '궁궐',
                            style: TextStyle(
                              color: Colors.white, // 텍스트 색상 설정
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                              Icons.close,
                              color: colorPallet.deep_green,
                              size: 16
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때의 동작
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: colorPallet.light_green, // 버튼 배경색 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 5만큼 둥글게
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8), // 내부 패딩 조정
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '청자',
                            style: TextStyle(
                              color: Colors.white, // 텍스트 색상 설정
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                                Icons.close,
                                color: colorPallet.deep_green,
                                size: 16
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때의 동작
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: colorPallet.light_green, // 버튼 배경색 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 5만큼 둥글게
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8), // 내부 패딩 조정
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '석탑',
                            style: TextStyle(
                              color: Colors.white, // 텍스트 색상 설정
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                                Icons.close,
                                color: colorPallet.deep_green,
                                size: 16
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  SizedBox(
                    width: 70,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때의 동작
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: colorPallet.light_green, // 버튼 배경색 설정
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // 모서리를 5만큼 둥글게
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8), // 내부 패딩 조정
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '불전',
                            style: TextStyle(
                              color: Colors.white, // 텍스트 색상 설정
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Icon(
                                Icons.close,
                                color: colorPallet.deep_green,
                                size: 16
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
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
