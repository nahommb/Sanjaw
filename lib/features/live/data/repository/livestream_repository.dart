import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/live/data/model/live_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LivestreamRepository {

  final baseUrl = BaseUrls.apiBaseUrl;

  Future<List<LiveModel>> fetchMatchEvents(String matchId) async {
    final response = await http.get(Uri.parse('$baseUrl/live/match/$matchId/events'));
    if (response.statusCode == 200) {
      final data = response.body;
      final List jsonData = jsonDecode(data);
      return jsonData.map((json) => LiveModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch match events");
    }
  } 
}