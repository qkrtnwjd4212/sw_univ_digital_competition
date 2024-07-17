import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import '../model/info_model.dart';
import '../model/info_voice_model.dart';
import 'dart:convert';

class InfoVoiceService {
  static Future<InfoVoice> fetchInfoVoice(Info info) async {
    final response = await http.get(Uri.parse(
        'http://www.khs.go.kr/cha/SearchVoiceOpenapi.do'
            '?ccbaGbn=kr'
            '&ccbaKdcd=${info.ccbaKdcd}'
            '&ccbaAsno=${info.ccbaAsno}'
            '&ccbaCtcd=${info.ccbaCtcd}'));

    if (response.statusCode == 200) {
      final Xml2Json xml2json = Xml2Json();
      xml2json.parse(response.body);
      final jsonString = xml2json.toParker(); // XML 데이터를 JSON 문자열로 변환
      final Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

      String voiceUrl = jsonResponse['result']['item']['voiceUrl'];
      // json으로 변환 과정에서 생기는 특수문자 제거
      voiceUrl = voiceUrl.replaceAll('\\r', '').replaceAll('\\n', '').replaceAll('\\t', '').replaceAll('\\', '');

      return InfoVoice.fromJson({
        'ccbaMnm1': jsonResponse['result']['item']['ccbaMnm1'],
        'voiceUrl': voiceUrl,
      });
    } else {
      throw Exception('Failed to load infoDetail');
    }
  }
}