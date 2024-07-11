import 'package:docent/commons/color_pallet.dart';
import 'package:flutter/material.dart';

class CulturalHeritagePlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    var heritageName = "경주 불국사 사리탑";
    var description = "불국사 강당 뒤쪽의 보호각에 보존되어 있는 사리탑으로, "
        "『불국사사적기(佛國寺事蹟記)』에서 말하는 '광학부도(光學浮屠)'가 곧 이 사리탑을 가리킨다는 견해도 있지만 "
        "현재로서는 여래의 사리탑인지 승려의 사리탑인지는 분명하지 않다.";

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
      body: SingleChildScrollView(
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
              heritageName,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // 막대 끝부분을 둥글게 만듭니다
              child: Container(
                height: 7.0, // 막대의 높이를 설정합니다
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: colorPallet.gray_d9,
                  valueColor:  AlwaysStoppedAnimation<Color>(colorPallet.light_green),
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.replay_10),
                  onPressed: () {
                    // Handle replay 10 seconds action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    // Handle pause action
                  },
                ),
                IconButton(
                  icon: Icon(Icons.forward_10),
                  onPressed: () {
                    // Handle forward 10 seconds action
                  },
                ),
                Text("1X", style: TextStyle(fontSize: 16)),
              ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Row 안의 내용이 가운데 정렬되도록 설정합니다
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.download,
                      color: colorPallet.beige,
                    ),
                    Text(
                      '  저장하기',
                      style: TextStyle(
                        fontSize: 16,
                        color: colorPallet.beige,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: [
                Chip(
                  label: Text('# 이야기 중심'),
                ),
                Chip(
                  label: Text('# 건축학적'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '해설',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape),
            label: '문화재',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이',
          ),
        ],
      ),
    );
  }
}
