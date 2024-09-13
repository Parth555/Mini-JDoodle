import 'dart:convert';
import 'package:http/http.dart' as http;

class JDoodleAuth {
  static Future<String> getAuthToken(String clientId, String clientSecret) async {
    final response = await http.post(
      Uri.parse('https://api.jdoodle.com/v1/auth-token'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'clientId': clientId,
        'clientSecret': clientSecret,
      }),
    );

    if (response.statusCode == 200) {
     return response.body;
    } else {
      throw Exception('Failed to obtain authentication token');
    }
  }
}