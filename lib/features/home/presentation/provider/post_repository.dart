import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/home/data/models/post_model.dart';


class PostRepository {
  
  final String baseUrl = BaseUrls.apiBaseUrl; // your API endpoint

  Future<List<PostModel>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse('$baseUrl/posts?page=$page'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch posts");
    }
  }
}
