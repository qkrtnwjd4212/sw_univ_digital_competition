import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import '../model/info_model.dart';
import 'dart:convert';
// import 'info_detail_service.dart';

// 'http://www.khs.go.kr/cha/SearchKindOpenapiList.do?pageUnit=20&ccbaCncl=N&ccbaKdcd=11&ccbaCtcd=11&ccbaMnm1=$query'

class InfoService {
  static Future<List<Info>> fetchInfos({ // 객체
    required String query,
    String? regionCode,
    String? categoryCode,
  }) async {
    String url =
        'http://www.khs.go.kr/cha/SearchKindOpenapiList.do?ccbaMnm1=$query';

    if (regionCode != null && regionCode.isNotEmpty) {
      url += '&ccbaCtcd=$regionCode';
    }
    if (categoryCode != null && categoryCode.isNotEmpty) {
      url += '&ccbaKdcd=$categoryCode';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Xml2Json xml2json = Xml2Json();
      xml2json.parse(response.body);
      final jsonString = xml2json.toParker(); // XML 데이터를 JSON 문자열로 변환
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      // item 개수가 1개 -> 객체, 여러개 -> 배열 구분하기
      int totalCnt = int.parse(jsonResponse['result']['totalCnt']); // api -> 문자열로 들어옴!!!!

      if (totalCnt > 1) {
        List<dynamic> data = jsonResponse['result']['item'];
        List<Info> infos =
        data.map((item) => Info.fromJson(item)).toList();
        return infos;
      } else if (totalCnt == 1) {
        dynamic data = jsonResponse['result']['item'];
        Info info = Info.fromJson(data);
        return [info];
      } else {
        // 데이터가 없는 경우
        return [];
      }

      // final List<dynamic> data =
      //     jsonResponse['result']['item'];

      // List<Info> infos = data.map((item) => Info.fromJson(item)).toList();

      // // 각 항목에 대한 detail API 호출
      // for(Info item in infos) {
      //   final detail = await InfoDetailService.fetchInfoDetail(item);
      //   item.imageUrl = detail.imageUrl;
      //   print(item.ccbaMnm1);
      // }

      // return infos;
    } else {
      throw Exception('Failed to load infos');
    }
  }
}
