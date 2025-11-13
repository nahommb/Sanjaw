

import 'dart:convert';

class StoryModel {
  final String? title;
  final String? content;
  final List<String> storyUrls;

  StoryModel(
    {this.title,
    this.content,
    this.storyUrls = const [],
}); 


factory StoryModel.fromJson(Map<String,dynamic> json){

      List<String> parseStoryUrls = [];

      if(json['media_urls'] != null){
          final raw = json['media_urls'];
        try{
          if(raw is String && raw.isNotEmpty){

            final decode = jsonDecode(raw);

            if(decode is List){
              parseStoryUrls = decode.map((element)=>element.toString()).toList();
            }
          } 
          else if(raw is List){
              parseStoryUrls = raw.map((element)=>element.toString()).toList();
            }
        }catch(err){
          print(err);
        }
      }
  return StoryModel(
    title: json['title'] as String,
    content: json['content'] as String,
    storyUrls: parseStoryUrls,
  );
}

}