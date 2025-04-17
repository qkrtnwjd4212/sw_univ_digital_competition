import 'package:flutter/material.dart';

import '../../commons/BottomBar.dart';
import '../../services/info_service.dart';
import '../../model/info_model.dart';
import '../../commons/DownloadHeritageBox.dart';

class MyDownnloads extends StatefulWidget {
  const MyDownnloads({super.key});

  @override
  State<MyDownnloads> createState() => _MyDownnloadsState();
}

class _MyDownnloadsState extends State<MyDownnloads> {

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // 해당 인덱스로 페이지 변경
    });
  }

  Future<Info> _fetchInfo(String title) async {
    try {
      final List<Info> infoList = await InfoService.fetchInfos(query: title);
      return infoList[0];
    } catch (e) {
      print('Error fetching info: $e');
      throw Exception('Failed to fetch info for $title');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('다운로드한 컨텐츠', style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FutureBuilder<Info>(
              future: _fetchInfo('근정전'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final info1 = snapshot.data!;
                return Column(
                  children: [
                    DownloadHeritageBox(
                      img: 'lib/assets/images/근정전.jpg',
                      name: '경복궁 근정전',
                      info: info1,
                    ),
                    FutureBuilder<Info>(
                      future: _fetchInfo('덕수궁'), // '덕수궁' 정보 가져오기
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        final info2 = snapshot.data!; // '덕수궁' 정보 저장
                        return DownloadHeritageBox(
                          img: 'lib/assets/images/덕수궁.jpg',
                          name: '덕수궁',
                          info: info2, // '덕수궁' 정보 전달
                        );
                      },
                    ),
                    FutureBuilder<Info>(
                      future: _fetchInfo('경회루'), // '경회루' 정보 가져오기
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }
                        final info3 = snapshot.data!; // '경회루' 정보 저장
                        return DownloadHeritageBox(
                          img: 'lib/assets/images/경회루.jpg',
                          name: '경복궁 경회루',
                          info: info3, // '경회루' 정보 전달
                        );
                      },
                    ),
                    // DownloadHeritageBox(
                    //   img: 'lib/assets/images/덕수궁.jpg',
                    //   name: '덕수궁',
                    //   info: info,
                    // ),
                    // DownloadHeritageBox(
                    //   img: 'lib/assets/images/경회루.jpg',
                    //   name: '경회루',
                    //   info: info,
                    // ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
