import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../commons/BottomBar.dart';
import 'package:geolocator/geolocator.dart';


class HeritagePage extends StatefulWidget {
  const HeritagePage({super.key});

  @override
  State<HeritagePage> createState() => _HeritagePageState();
}

class _HeritagePageState extends State<HeritagePage> {

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
      body: Column(
        children: [
          Expanded(
            child: NaverMap(
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
