import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/home/data/models/story_model.dart';

class StoryRepository {
  Future<List<StoryModel>> fetchStory() async{
    final response = await http.get(Uri.parse('$BaseUrls.apiBaseUrl/story'));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);

      return data.map((json)=>StoryModel.fromJson(json)).toList();
    }
    else{
      throw Exception('Error fetching');
    }
   
  }
}