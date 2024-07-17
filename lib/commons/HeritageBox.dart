import 'package:flutter/material.dart';
import '../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HeritageBox extends StatelessWidget {
  HeritageBox({super.key,
    required this.img,
    required this.name,
    required this.location
  });
  final img;
  final name;
  final location;

  final ColorPallet colorPallet = ColorPallet();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * 0.25,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(img),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          // 좋아요 로직 추가

                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                  ),
                  SizedBox(height: 7,),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 17,
                        color: colorPallet.light_green,
                      ),
                      SizedBox(width: 5), // 아이콘과 텍스트 사이에 약간의 간격 추가
                      Text(location, style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffC3C3C3),
                      )),
                    ],
                  )
                ],
              )
            ],
          ),
          Divider(
            color: Color(0xffC3C3C3),
            thickness: 1,
            height: 20,
          )

        ],
      ),
    );
  }
}
