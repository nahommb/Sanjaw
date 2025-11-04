import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/home/data/models/match_day_model.dart';

class MatchDayRepository {
 final String baseUrl = BaseUrls.apiBaseUrl;

 Future<List<MatchDayModel>> fatchMatch()async{
  final response = await http.get(Uri.parse('$baseUrl/posts/matchdays'));
  if(response.statusCode == 200){
   final List data = jsonDecode(response.body);
  //  print(data);
   return data.map((json) => MatchDayModel.fromJson(json)).toList();
  }
  else{
    throw Exception((e)=>e.err);
  }
 }
}