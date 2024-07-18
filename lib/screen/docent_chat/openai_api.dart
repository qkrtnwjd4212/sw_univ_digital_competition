import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIService {
  final String apiKey = dotenv.env['OPENAI_API_KEY']!;

  Future<String> getResponse(String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-4',
        'messages': [
          {'role': 'system', 'content': 'You are a helpful assistant.'},
          {'role': 'user', 'content': prompt}
        ],
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      final data = utf8.decode(response.bodyBytes);  // UTF-8로 디코딩
      final jsonData = jsonDecode(data);
      return jsonData['choices'][0]['message']['content'].trim();
    } else {
      print('Failed to load response: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load response from OpenAI');
    }
  }
}
