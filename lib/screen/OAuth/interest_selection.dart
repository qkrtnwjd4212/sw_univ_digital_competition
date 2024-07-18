import 'package:docent/commons/color_pallet.dart';
import 'package:docent/data/auth_controller.dart'; // AuthController 임포트
import 'package:docent/screen/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // GetX 임포트

class InterestSelectionScreen extends StatefulWidget {
  @override
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  ColorPallet colorPallet = ColorPallet();
  List<String> types = [
    '궁궐',
    '청자',
    '불전',
    '석탑',
    '불교공예',
    '성곽',
    '무덤',
    '비',
  ];
  List<String> periods = [
    '조선시대',
    '고려시대',
    '삼국시대',
    '통일신라시대',
    '근현대',
  ];
  late List<bool> selectedTypes;
  late List<bool> selectedPeriods;
  String selectedCity = '부산';

  final AuthController authController = Get.find(); // AuthController 인스턴스 가져오기

  @override
  void initState() {
    super.initState();
    selectedTypes = List.generate(types.length, (index) => false);
    selectedPeriods = List.generate(periods.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('관심사 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '주은님의 관심사를 선택해주세요',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '홈에서 맞춤 문화를 추천해 드릴게요!',
              style: TextStyle(
                  fontSize: 20,
                  color: colorPallet.gray_82
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List<Widget>.generate(types.length, (int index) {
                return ChoiceChip(
                  label: Text(types[index]),
                  selected: selectedTypes[index],
                  selectedColor: colorPallet.light_green,
                  backgroundColor: colorPallet.gray_d9,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedTypes[index] = selected;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List<Widget>.generate(periods.length, (int index) {
                return ChoiceChip(
                  label: Text(periods[index]),
                  selected: selectedPeriods[index],
                  selectedColor: colorPallet.light_green,
                  backgroundColor: colorPallet.gray_d9,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedPeriods[index] = selected;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedCity,
              onChanged: (newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
              },
              items: <String>['서울', '부산', '대구', '인천', '광주', '대전', '울산', '경기', '강원', '충북', '충남', '전북', '전남', '경북', '경남', '세종', '제주']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  // 선택된 관심사, 기간, 도시 정보를 AuthController를 통해 갱신
                  List<String> selectedTypeNames = [];
                  List<String> selectedPeriodNames = [];

                  for (int i = 0; i < types.length; i++) {
                    if (selectedTypes[i]) {
                      selectedTypeNames.add(types[i]);
                    }
                  }

                  for (int i = 0; i < periods.length; i++) {
                    if (selectedPeriods[i]) {
                      selectedPeriodNames.add(periods[i]);
                    }
                  }

                  authController.updateUserInterests(
                    selectedTypeNames,
                    selectedPeriodNames,
                    selectedCity,
                  );

                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: TextButton.styleFrom(
                  backgroundColor: colorPallet.deep_green, // Button color
                  padding: EdgeInsets.symmetric(horizontal: width*0.3, vertical: height*0.015),
                ),
                child: Text('선택 완료',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
