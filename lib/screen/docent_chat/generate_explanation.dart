import 'package:docent/commons/BottomBar.dart';
import 'package:docent/commons/color_pallet.dart';
import 'package:docent/screen/docent_chat/play_explanation.dart';
import 'package:flutter/material.dart';

class GenerateExplanationScreen extends StatefulWidget {
  @override
  _GenerateExplanationScreenState createState() => _GenerateExplanationScreenState();
}

class _GenerateExplanationScreenState extends State<GenerateExplanationScreen> {
  var heritage_name = "경복궁 경회루";
  var tags = [];
  final TextEditingController tagController = TextEditingController();

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
    });
    tagController.clear();
  }

  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
        title: Text(
          '선택된 문화재',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              "lib/assets/images/dummy_1.jpg",
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Text(
              '${heritage_name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              '어떤 스타일의 이야기가 듣고 싶나요?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.67,
                  child: TextField(
                    controller: tagController,
                    cursorColor: colorPallet.light_green, // 커서 색깔 설정
                    decoration: InputDecoration(
                      hintText: '예) 사건사고',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorPallet.light_green, width: 2.0,), // 포커스 시 언더라인 색깔 설정
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (tagController.text.isNotEmpty) {
                      addTag(tagController.text);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              children: tags.map((tag) {
                return Chip(
                  backgroundColor: colorPallet.light_green,
                  label: Text(
                    '# $tag',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 둥글기의 정도를 설정
                    side: BorderSide(
                      color: colorPallet.light_green, // 외곽선 색상을 colorPallet.light_green으로 설정
                      width: 1.0,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Container(
              width: width * 0.8,
              child: Text('언어 선택', style: TextStyle(
                fontSize: 18,
              ),),
            ),
            SizedBox(height: 5,),
            Container(
              width: width * 0.8,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: colorPallet.light_green, width: 2.0),
                  ),
                ),
                value: '한국어',
                items: <String>['한국어', '영어'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                icon: Icon(Icons.arrow_drop_down, color: colorPallet.light_green), // 화살표 버튼 색상 설정
                dropdownColor: Colors.white, // 아이템 창의 배경을 흰색으로 설정
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 260,
              height: 46,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayExplanationScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(colorPallet.deep_green),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                child: Container(
                  width: width * 0.8,
                  height: height * 0.05,
                  alignment: Alignment.center,
                  child: Text(
                    '해설 생성하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        onTap: (p0) {},
        currentIndex: 1,
      ),
    );
  }
}
