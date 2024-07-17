import 'package:docent/screen/Heritage/HeritageListPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../../commons/BottomBar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../commons/color_pallet.dart';


class HeritagePage extends StatefulWidget {
  const HeritagePage({super.key});

  @override
  State<HeritagePage> createState() => _HeritagePageState();
}

class _HeritagePageState extends State<HeritagePage> {
  final ColorPallet colorPallet = ColorPallet();

  // 하단바 컨트롤
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  // 위치 정보 관련
  double latitude = 37.574187;
  double longitude = 126.976882;
  NaverMapController? _mapController; // 지도 컨트롤러

  Future<void> getGeoData() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되었는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // 위치 권한 확인
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // 현재 위치 정보 가져오기
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude;
      longitude = position.longitude;
      //print("---------latitude: ${latitude}, longitude: ${longitude}---------");
    });
  }

  @override
  void initState() {
    super.initState();
    getGeoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NaverMap(
            options: NaverMapViewOptions(
              locationButtonEnable: true,
              initialCameraPosition: NCameraPosition(
                target: NLatLng(latitude, longitude),
                zoom: 15,
              )
            ),
            onMapReady: (controller) {
              _mapController = controller;
              print('네이버 맵 로딩됨!');
            },
          ),

          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
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
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton(

                backgroundColor: Colors.white,
                onPressed: () {
                  Get.to(HeritageListPage());
                },
                child: Icon(
                  Icons.list,
                  color: colorPallet.deep_green,
                  size: 34,
                ),
              )
          ),


        ],
      ),


      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
