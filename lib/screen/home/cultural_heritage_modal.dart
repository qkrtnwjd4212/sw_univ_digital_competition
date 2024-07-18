import 'package:flutter/material.dart';

class CulturalModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.6,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text('7월 19일 - 백제 멸망', style: TextStyle(fontSize: 19)),

            ),
            actions: [ // 오른쪽 상단 닫기 버튼
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            leading: Container(),
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  '섬세하고 세련된 문화를 가졌던 백제의 문화재를 탐험해보세요!',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              _buildCulturalHeritageItem(
                'lib/assets/images/부여_부소산성.jpg',
                '부여 부소산성',
                '충남 부여군 부여읍 부소로 31 (쌍북리)',
              ),
              Divider(color: Colors.grey),
              _buildCulturalHeritageItem(
                'lib/assets/images/익산_미륵사지.jpg',
                '익산 미륵사지 석탑',
                '전북 익산시 금마면 기양리 97번지',
              ),
              Divider(color: Colors.grey),
              _buildCulturalHeritageItem(
                'lib/assets/images/백제_금동대향로.jpg',
                '백제 금동대향로',
                '충청남도 부여군',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCulturalHeritageItem(
      String imagePath, String title, String location) {
    return ListTile(
      leading: Image.asset(
        width: 100,
        imagePath,
        fit: BoxFit.cover,
      ),
      title: Text(title),
      subtitle: Text(
        location,
        style: TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
