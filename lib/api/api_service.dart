import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://staging3.hashfame.com/api/v1/interview.mplist';

  Future<Map<String, dynamic>> fetchMarketplaceRequest({int page = 1}) async {
    try {
      final Uri uri = Uri.parse('$baseUrl?page=$page');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}