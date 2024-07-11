import 'package:docent/commons/color_pallet.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var username = "주은";

  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.12, width * 0.07, height * 0.05),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${username}님의 관심사를 선택해 주세요",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("홈에서 맞춤 문화재를 추천해 드릴게요!",
                    style: TextStyle(
                      fontSize: 20,
                      color: colorPallet.gray_82,
                    ),
                  )
              ]
            ),
          )
        ],
      ),
    );
  }
}
