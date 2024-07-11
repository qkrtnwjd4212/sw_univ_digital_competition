import 'package:docent/commons/color_pallet.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    ColorPallet colorPallet = ColorPallet();
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text("로그인",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
          )),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: height*0.1, horizontal: width*0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("로그인으로 나만의",
                  style: TextStyle(
                    fontSize: 24,
                    color: colorPallet.gray_82,
                  ),
                ),
                Text("AI 도슨트의 추천을 받아요!",
                  style: TextStyle(
                    fontSize: 24,
                    color: colorPallet.gray_82,
                  ),)
              ],
            ),
          )
          // 소셜로그인 버튼들이 들어갈 곳...
        ],
      ),
    );
  }
}
