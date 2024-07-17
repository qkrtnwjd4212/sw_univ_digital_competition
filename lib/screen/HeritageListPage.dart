import 'package:flutter/material.dart';
import '../commons/BottomBar.dart';
import '../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'HeritagePage.dart';



class HeritageListPage extends StatefulWidget {
  const HeritageListPage({super.key});

  @override
  State<HeritageListPage> createState() => _HeritageListPageState();
}

class _HeritageListPageState extends State<HeritageListPage> {
  final ColorPallet colorPallet = ColorPallet();

  // 하단바 컨트롤
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  List<String> city_list = ['서울', '경기', '부산', '대구', '인천', '광주',' 대전','울산', '강원'];
  List<String> type_list = ['탑', '성곽시설', '불전', '석등'];
  String? selectedCity;
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.07,),
                // 지역, 분류 선택
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        iconEnabledColor: colorPallet.light_green,
                        iconDisabledColor: colorPallet.light_green,
                        iconSize: 30,
                        decoration: InputDecoration(
                          labelText: '지역',
                          labelStyle: TextStyle(
                            color: Color(0xffCACACA),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPallet.light_green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)
                        ),
                        value: selectedCity,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCity = newValue;
                          });
                        },
                        items: city_list.map<DropdownMenuItem<String>>((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        iconEnabledColor: colorPallet.light_green,
                        iconDisabledColor: colorPallet.light_green,
                        iconSize: 30,
                        decoration: InputDecoration(
                            labelText: '분류',
                            labelStyle: TextStyle(
                              color: Color(0xffCACACA),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: colorPallet.light_green),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12)
                        ),
                        value: selectedType,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedType = newValue;
                          });
                        },
                        items: type_list.map<DropdownMenuItem<String>>((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                // 검색창
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: colorPallet.light_green,
                      width: 1
                    )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Color(0xff729493),
                          decoration: InputDecoration(
                            hintText: '문화재명, 키워드, 지역 검색',
                            hintStyle: TextStyle(
                              color: Color(0xffCACACA),
                              fontSize: 18,
                            ),

                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Color(0xff729493),
                        ),
                        onPressed: () {
                          // 검색 버튼 클릭 시 동작 추가
                          print("검색 버튼 클릭됨");
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03,),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // 플로팅 액션 버튼을 눌렀을 때 HeritagePage로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HeritagePage()),
          );
        },
        child: Icon(
          Icons.map,
          color: colorPallet.deep_green,
          size: 34,
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

