import 'dart:convert';
import 'package:chat_gpt_clone/models/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> getDataFromOpenAI(String query) async {
    final response = await http.post(
      Uri.parse(
          'https://api.openai.com/v1/engines/text-davinci-003/completions'),
      headers: {
        'Content-Type': contentType,
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': query,
        'max_tokens': 300,
        'temperature': 0,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get data from OpenAI API');
    }
  }
}
