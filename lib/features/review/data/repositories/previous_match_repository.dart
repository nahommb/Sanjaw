
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sanjaw/core/constants/base_urls.dart';
import 'package:sanjaw/features/review/data/model/previousMatchesModel.dart';

class PreviousMatchRepository {

  Future<List<Previousmatchesmodel>> fetchPreviousMatches() async{
    final baseUrl = BaseUrls.apiBaseUrl;
    final response = await http.get(Uri.parse('$baseUrl/getpreviousmatches'));

    if(response.statusCode == 200){
      final List data = jsonDecode(response.body);

      return data.map((json)=>Previousmatchesmodel.fromJson(json)).toList();
    }
    else{
      throw Exception('error fetching previous matches');
    }
  }
  }