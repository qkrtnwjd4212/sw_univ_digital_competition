import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import '../model/info_model.dart';
import '../model/info_detail_model.dart';
import 'dart:convert';

class InfoDetailService {
  static Future<InfoDetail> fetchInfoDetail(Info info) async {
    final response = await http.get(Uri.parse(
        'http://www.khs.go.kr/cha/SearchKindOpenapiDt.do'
            '?ccbaKdcd=${info.ccbaKdcd}'
            '&ccbaAsno=${info.ccbaAsno}'
            '&ccbaCtcd=${info.ccbaCtcd}'));

    if (response.statusCode == 200) {
      final Xml2Json xml2json = Xml2Json();
      xml2json.parse(response.body);
      final jsonString = xml2json.toParker(); // XML 데이터를 JSON 문자열로 변환
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
      final dynamic data = jsonResponse['result']['item']; // API의 응답 형식에 맞게 조정 필요

      return InfoDetail.fromJson(data);
    } else {
      throw Exception('Failed to load infoDetail');
    }
  }
}