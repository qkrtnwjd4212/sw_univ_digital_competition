import 'package:docent/screen/Heritage/HeritageDetail.dart';
import 'package:flutter/material.dart';
import '../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/info_detail_model.dart';
import '../model/info_model.dart';
import '../services/info_detail_service.dart';

class DownloadHeritageBox extends StatelessWidget {
  DownloadHeritageBox({
    super.key,
    required this.img,
    required this.name,
    required this.info,
  });

  final String? img;
  final String name;
  final Info info;

  final ColorPallet colorPallet = ColorPallet();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Get.to(() => HeritageDetail(info: info));
      },
      child: FutureBuilder<InfoDetail>(
        future: InfoDetailService.fetchInfoDetail(info),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color: colorPallet.light_green,
            ));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading details'));
          }
          final detail = snapshot.data!;
          return Container(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width * 0.25,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: img != null
                                ? Image.asset(
                              img!,
                              fit: BoxFit.cover,
                              width: width * 0.25,
                              height: 80,
                            )
                                : Container(
                              width: width * 0.25,
                              height: 80,
                              color: Colors.grey[300],
                            ),
                          ),
                          Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              detail.content,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xffC3C3C3),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xffC3C3C3),
                  thickness: 1,
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

