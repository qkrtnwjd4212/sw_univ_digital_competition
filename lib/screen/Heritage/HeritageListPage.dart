import 'package:docent/commons/HeritageBox.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../commons/BottomBar.dart';
import '../../commons/color_pallet.dart';
import '../../services/info_service.dart';
import '../../model/info_model.dart';
import '../../services/info_detail_service.dart';
import '../../model/info_detail_model.dart';
import '../../services/info_voice_service.dart';
import '../../model/info_voice_model.dart';
import 'HeritagePage.dart';

class HeritageListPage extends StatefulWidget {
  @override
  _HeritageListPageState createState() => _HeritageListPageState();
}

class _HeritageListPageState extends State<HeritageListPage> {
  final TextEditingController _controller = TextEditingController();
  Future<List<Info>>? _searchResults;

  String? _selectedRegion;
  String? _selectedCategory;
  final Map<String, String> _regions = {
    // ccbaCtcd 시도코드
    '지역 선택': '',
    '서울': '11',
    '부산': '21',
    '대구': '22',
    '인천': '23',
    '광주': '24',
    '대전': '25',
    '울산': '26',
    '세종': '45',
    '경기': '31',
    '강원': '32',
    '충북': '33',
    '충남': '34',
    '전북': '35',
    '전남': '36',
    '경북': '37',
    '경남': '38',
    '제주': '50',
    '전국일원': 'ZZ',
  };
  final Map<String, String> _categories = {
    // ccbaKdcd 종목코드
    '분류 선택': '',
    '국보': '11',
    '보물': '12',
    '사적': '13',
    '사적및명승': '14',
    '명승': '15',
    '천연기념물': '16',
    '국가무형유산': '17',
    '국가민속문화유산': '18',
    '시도유형문화유산': '21',
    '시도무형유산': '22',
    '시도기념물': '23',
    '시도민속문화유산': '24',
    '시도등록유산': '25',
    '문화유산자료': '31',
    '국가등록유산': '79',
    '이북5도 무형유산': '80',
  };

  void _search() {
    setState(() {
      _searchResults = InfoService.fetchInfos(
        query: _controller.text,
        regionCode: _selectedRegion,
        categoryCode: _selectedCategory,
      );
    });
  }

  void _clearSearch() {
    // 초기화하기
    setState(() {
      _controller.clear();
      _searchResults = null;
      _selectedCategory = '';
      _selectedRegion = '';
    });
  }

  void _loadImage(Info info) async {
    try {
      final InfoDetail detail = await InfoDetailService.fetchInfoDetail(info);
      setState(() {
        info.imageUrl = detail.imageUrl.isNotEmpty ? detail.imageUrl : null;
      });
    } catch (e) {
      print('error : $e');
    }
  }

  void _showInfoDetail(Info info) async {
    // 사용 예시
    try {
      final InfoDetail detail = await InfoDetailService.fetchInfoDetail(info);
      final InfoVoice infoVoice = await InfoVoiceService.fetchInfoVoice(info);

      final player = AudioPlayer();

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(info.ccbaMnm1), // 국가유산명(국문)
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('종목: ${detail.ccmaName}'),
                Text('종목코드: ${info.ccbaKdcd}'),
                Text('분류: ${detail.gcodeName}'),
                Text('지정(등록일): ${detail.ccbaAsdt}'),
                Text('소재지: ${detail.ccbaLcad}'),
                Text('시대: ${detail.ccceName}'),
                detail.imageUrl.isNotEmpty
                    ? Image.network(detail.imageUrl)
                    : Container(),
                Text('내용: ${detail.content}'),
                Text('나레이션 주소: ${infoVoice.voiceUrl}'),
                ElevatedButton(
                  onPressed: () async {
                    if (infoVoice.voiceUrl.isNotEmpty) {
                      await player.setUrl(infoVoice.voiceUrl);
                      player.play();
                    }
                  },
                  child: Text('나레이션 듣기'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
                player.dispose();
              },
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to load info detail'),
          actions: [
            TextButton(
              child: Text('닫기'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  final ColorPallet colorPallet = ColorPallet();
  // 하단바 컨트롤
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          child: Column(
            children: [
              SizedBox(height: height * 0.07,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      iconEnabledColor: colorPallet.light_green,
                      iconDisabledColor: colorPallet.light_green,
                      iconSize: 30,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPallet.light_green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPallet.light_green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                      ),
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      value: _selectedRegion ?? '',
                      items: _regions.entries.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.value,
                          child: Text(entry.key, style: TextStyle(
                            color: Color(0xffCACACA)
                          ),),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRegion = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      iconEnabledColor: colorPallet.light_green,
                      iconDisabledColor: colorPallet.light_green,
                      iconSize: 30,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPallet.light_green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colorPallet.light_green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 5, 10),

                      ),
                      value: _selectedCategory ?? '',
                      dropdownColor: Colors.white,
                      hint: Text('분류'),
                      items: _categories.entries.map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.value,
                          child: Text(entry.key, style: TextStyle(
                              color: Color(0xffCACACA)
                          ),),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              // 검색창
              TextField(
                cursorColor: colorPallet.deep_green,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '문화재 이름을 입력하세요',
                  hintStyle: TextStyle(
                    color: Color(0xffCACACA),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: colorPallet.light_green,
                    ),
                    onPressed: _clearSearch,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        Icons.search,
                        color: colorPallet.light_green,
                    ),
                    onPressed: _search,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPallet.light_green), // 기본 외곽선 색상 설정
                    borderRadius: BorderRadius.circular(15), // 모서리를 둥글게 설정
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPallet.light_green), // 포커스된 외곽선 색상 설정
                    borderRadius: BorderRadius.circular(15), // 모서리를 둥글게 설정
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: colorPallet.light_green), // 기본 외곽선 색상 설정
                    borderRadius: BorderRadius.circular(15), // 모서리를 둥글게 설정
                  ),
                ),
              ),

              // 검색 결과
              if (_searchResults != null)
                Expanded(
                  child: FutureBuilder<List<Info>>(
                    future: _searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator()); // 로딩중
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                            child: Text('검색결과 없음')
                        );
                      }
                      final infos = snapshot.data!;
                      return ListView.builder(
                        itemCount: infos.length,
                        itemBuilder: (context, index) {
                          final info = infos[index];
                          if (info.imageUrl == null) {
                            _loadImage(info);
                          }
                          return HeritageBox(
                              img: info.imageUrl,
                              name: info.ccbaMnm1,
                              info: info);
                          // return ListTile(
                          //   leading: SizedBox(
                          //     // 이미지 칸
                          //     width: MediaQuery.of(context).size.width * 0.2,
                          //     height: MediaQuery.of(context).size.height * 0.2,
                          //     child: info.imageUrl != null
                          //         ? Image.network(
                          //             info.imageUrl!,
                          //             width: 50,
                          //             height: 50,
                          //             fit: BoxFit.contain,
                          //           )
                          //         : Container(
                          //             color: Colors.grey[300],
                          //           ),
                          //   ),
                          //   title: Text(info.ccbaMnm1),
                          //   subtitle: Text('관리번호: ${info.ccbaAsno}'),
                          //   onTap: () => _showInfoDetail(info),
                          // );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // 플로팅 액션 버튼을 눌렀을 때 HeritagePage로 이동
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HeritagePage()),
          );
        },
        child: Icon(
          Icons.map,
          color: colorPallet.deep_green,
          size: 34,
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
