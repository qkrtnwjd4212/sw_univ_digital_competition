import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../commons/BottomBar.dart';
import '../../commons/color_pallet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/info_detail_model.dart';
import '../../model/info_model.dart';
import '../../model/info_voice_model.dart';
import '../../services/info_detail_service.dart';
import '../../services/info_voice_service.dart';
import '../docent_chat/generate_explanation.dart';

class HeritageDetail extends StatefulWidget {
  const HeritageDetail({super.key, required this.info});
  final Info info;

  @override
  State<HeritageDetail> createState() => _HeritageDetailState();
}

class _HeritageDetailState extends State<HeritageDetail> {
  final ColorPallet colorPallet = ColorPallet();
  late Future<InfoDetail> _infoDetail;
  late Future<InfoVoice> _infoVoice;

  // 하단바 컨트롤
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  @override
  void initState() {
    super.initState();
    _infoDetail = InfoDetailService.fetchInfoDetail(widget.info);
    _infoVoice = InfoVoiceService.fetchInfoVoice(widget.info);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //title: Text('Heritage Detail'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<InfoDetail>(
        future: _infoDetail,
        builder: (context, detailSnapshot) {
          if (detailSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color: colorPallet.light_green,
            ));
          }
          if (detailSnapshot.hasError) {
            return Center(child: Text('Error loading details'));
          }
          final detail = detailSnapshot.data!;
          return FutureBuilder<InfoVoice>(
            future: _infoVoice,
            builder: (context, voiceSnapshot) {
              if (voiceSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(
                  color: colorPallet.light_green,
                ));
              }
              if (voiceSnapshot.hasError) {
                return Center(child: Text('Error loading voice info'));
              }
              final infoVoice = voiceSnapshot.data!;
              final player = AudioPlayer();

              // UI
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    detail.imageUrl.isNotEmpty
                        ? Image.network(detail.imageUrl)
                        : Container(),
                    SizedBox(height: 15),

                    Container(
                      width: width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.info.ccbaMnm1,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              IconButton(onPressed: () {

                              },
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            detail.content.replaceAll('\\n', '\n').replaceAll('\\', ''),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            softWrap: true,
                          ),
                          SizedBox(height: 10,),
                          Divider(
                            color: Color(0xffC3C3C3),
                            height: 20,
                            thickness: 1,),

                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: colorPallet.light_green,
                              ),
                              SizedBox(width: 10,),
                              Text(
                                  detail.ccbaLcad.replaceAll('\/ ', '\n'),
                                style: TextStyle(
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(
                                Icons.book,
                                color: colorPallet.light_green,
                              ),
                              SizedBox(width: 10,),
                              Text('${detail.ccmaName} | ${detail.gcodeName}',
                              style: TextStyle(
                                fontSize: 16
                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later,
                                color: colorPallet.light_green,
                              ),
                              SizedBox(width: 10,),
                              Text('${detail.ccceName}',
                                style: TextStyle(
                                    fontSize: 16
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30,),

                          Center(
                            child: Container(
                              width: 260,
                              height: 46,
                              child: TextButton(onPressed: () {
                                Get.to(GenerateExplanationScreen());
                              },
                                  style: TextButton.styleFrom(
                                    backgroundColor: colorPallet.deep_green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15), // 모서리를 15만큼 둥글게
                                    ),
                                  ),
                                  child: Text(
                                    '나만의 해설 들으러 가기',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white
                                    ),
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                          //ElevatedButton(
                          //  onPressed: () async {
                          //    if (infoVoice.voiceUrl.isNotEmpty) {
                          //      await player.setUrl(infoVoice.voiceUrl);
                          //      player.play();
                          //    }
                          //  },
                          //  child: Text('나레이션 듣기'),
                          //),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),

      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
