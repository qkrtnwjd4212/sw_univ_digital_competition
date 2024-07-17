import 'package:docent/commons/color_pallet.dart';
import 'package:flutter/material.dart';

class CulturalHeritageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var heritage_name = "낙화암";
    var tags = ["이야기 중심", "건축학적"];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
        title: Text('선택된 문화재',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'https://example.com/your_image.jpg', // Replace with your image URL
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              '${heritage_name}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('어떤 스타일의 이야기가 듣고 싶나요?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: '예) 사건사고',
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                Chip(
                  label: Text('# ${tags[0]}'),
                ),
                Chip(
                  label: Text('# ${tags[1]}'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: width*0.8,
              child: DropdownButton<String>(
                value: '한국어',
                items: <String>['한국어', '영어'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  // Handle language change
                },
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle button press
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(colorPallet.deep_green),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 여기서 보더의 radius를 설정합니다.
                  ),
                ),
              ),
              child: Container(
                width: width*0.8,
                height: height*0.05,
                alignment: Alignment.center, // 텍스트가 가운데 정렬되도록 설정합니다.
                child: Text(
                  '해설 생성하기',
                  style: TextStyle(
                    color: colorPallet.beige,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/icons/home.png')),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/icons/culture.png')),
            label: '문화재',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                AssetImage('lib/assets/icons/mypage.png')
            ),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
