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
  var tags = ["이야기 중심", "건축학적"];
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
      appBar: AppBar(
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
            SizedBox(height: 16),
            Text(
              '${heritage_name}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              children: [
                Expanded(
                  child: TextField(
                    controller: tagController,
                    decoration: InputDecoration(
                      hintText: '예) 사건사고',
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
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: tags.map((tag) {
                return Chip(
                  label: Text('# $tag'),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Container(
              width: width * 0.8,
              child: DropdownButton<String>(
                value: '한국어',
                items: <String>['한국어', '영어'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            SizedBox(height: 16),
            TextButton(
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
                    borderRadius: BorderRadius.circular(8.0),
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
                    color: Colors.white,
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
