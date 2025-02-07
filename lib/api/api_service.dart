import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static String url =
      'https://staging3.hashfame.com/api/v1/interview.mplist?id_hash=';

  Future<List<dynamic>> fetchMarketplaceRequest() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['marketplace_requests'];
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
