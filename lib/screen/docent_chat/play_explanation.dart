import 'dart:async';

import 'package:docent/commons/BottomBar.dart';
import 'package:docent/commons/color_pallet.dart';
import 'package:flutter/material.dart';

class PlayExplanationScreen extends StatefulWidget {
  @override
  _PlayExplanationScreenState createState() => _PlayExplanationScreenState();
}

class _PlayExplanationScreenState extends State<PlayExplanationScreen> {
  ColorPallet colorPallet = ColorPallet();

  var heritageName = "경복궁 경회루";
  var description = "경복궁은 서울의 중심부에 위치한 조선 왕조의 궁궐로, 한국의 중요한 문화재 중 하나입니다. 조선 태조 이성계가 1395년에 건립한 이 궁궐은 정치, 역사, 문화의 중심지로 기능했습니다. 경복궁은 한국 역사 속에서 여러 이야기를 품고 있습니다. 임진왜란 때 불타버렸으나 흥선대원군에 의해 재건되었습니다. 이곳에서 수많은 왕과 왕비, 신하들이 나라의 중요한 결정을 내렸습니다. 또한, 일제 강점기에는 궁궐의 많은 부분이 훼손되었으나, 현대에 와서는 복원 작업이 진행되어 현재의 모습을 되찾았습니다. 경복궁은 전통 한옥 건축의 정수를 보여줍니다. 정전인 근정전과 왕의 생활 공간인 강녕전, 그리고 후원의 향원정 등 각 건물은 독특한 조형미를 자랑합니다. 궁궐의 배치는 풍수지리 사상을 반영하여 지어졌으며, 건물들은 기둥과 서까래, 기와지붕 등 전통 목조 건축 기법을 사용했습니다. 또한, 궁궐 내의 정원과 연못은 자연과 조화를 이루며 아름다운 경관을 자아냅니다. 경복궁은 단순한 정치적 공간을 넘어, 왕과 왕비의 사랑 이야기도 담고 있습니다. 특히 경회루는 왕과 왕비가 함께 연회를 즐기던 장소로, 조선의 로맨스를 상징합니다. 또한, 후궁들이 머물던 공간과 후원은 이들의 삶과 사랑이 묻어나는 장소입니다. 경복궁은 한국의 역사와 문화를 상징하는 장소로, 많은 이들에게 사랑받고 있으며, 그 안에 담긴 다양한 이야기는 오늘날까지도 큰 감동을 줍니다.";

  double progressValue = 0.0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.01;
        } else {
          timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              heritageName,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // 막대 끝부분을 둥글게 만듭니다
              child: Container(
                height: 7.0, // 막대의 높이를 설정합니다
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: colorPallet.gray_d9,
                  valueColor: AlwaysStoppedAnimation<Color>(colorPallet.light_green),
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
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: Icon(Icons.forward_10),
                  onPressed: () {
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
                backgroundColor: WidgetStateProperty.all(colorPallet.deep_green),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // 여기서 보더의 radius를 설정합니다.
                  ),
                ),
              ),
              child: Container(
                width: width * 0.8,
                height: height * 0.05,
                alignment: Alignment.center, // 텍스트가 가운데 정렬되도록 설정합니다.
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Row 안의 내용이 가운데 정렬되도록 설정합니다
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.download,
                      color: Colors.white,
                    ),
                    Text(
                      '  저장하기',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
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
                Chip(
                  label: Text('# 사랑'),
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
      bottomNavigationBar: BottomBar(
        onTap: (p0) {
        },
        currentIndex: 1,
      ),
    );
  }
}
