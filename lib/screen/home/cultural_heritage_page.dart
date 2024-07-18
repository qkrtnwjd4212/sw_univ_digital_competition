import 'package:flutter/material.dart';
import 'cultural_heritage_modal.dart';

class CulturalHeritagePage extends StatelessWidget {
  final String title;

  CulturalHeritagePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: ListView(
        children: [
          _buildCulturalHeritageItem(
            'lib/assets/images/광주학생운동.jpg',
            '광주학생운동',
            '광주학생독립운동기념관',
            null,
          ),
          Divider(color: Colors.grey),
          _buildCulturalHeritageItem(
            'lib/assets/images/부여_부소산성.jpg',
            '백제 멸망',
            '부여 백제유적지',
            CulturalModal(),
          ),
          Divider(color: Colors.grey),
          _buildCulturalHeritageItem(
            'lib/assets/images/덕수궁.jpg',
            '고종 황제 강제 퇴위',
            '덕수궁',
            null,
          ),
        ],
      ),
    );
  }

  Widget _buildCulturalHeritageItem(
      String imagePath, String title, String location, Widget? modalPage) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: ListTile(
          leading: Image.asset(
            width: MediaQuery.of(context).size.width * 0.25,
            imagePath,
            fit: BoxFit.cover,
          ),
          title: Text(title),
          subtitle: Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(location, style: TextStyle(color: Colors.grey)),
            ],
          ),
          onTap: modalPage != null
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => modalPage,
                  );
                }
              : null,
        ),
      );
    });
  }
}
