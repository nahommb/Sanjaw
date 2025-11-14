import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/home/data/models/story_model.dart';

class StoryRepository {
  Future<List<StoryModel>> fetchStory() async{
    final response = await http.get(Uri.parse('${BaseUrls.apiBaseUrl}/stories/getstory'));
    if(response.statusCode == 200){
      final List data = jsonDecode(response.body);
      // print(data);
      return data.map((json)=>StoryModel.fromJson(json)).toList();
    }
    else{
      throw Exception('Error fetching story');
    }
   
  }
}