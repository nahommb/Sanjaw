import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:story_view/story_view.dart';

class StoryViewPage extends StatefulWidget {

  final List<String> story_urls;
 
  static String route_name = 'story_view_page';

  StoryViewPage({super.key,required this.story_urls});

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {

   final storyItems = widget.story_urls.map((story){

    if(story.endsWith('.mp4') || story.endsWith('.mkv') || story.endsWith('.mov') | story.endsWith('.avi')){
     return StoryItem.pageVideo(story, controller:controller);
     }
     else{
      if(!story.startsWith('http')){
        return StoryItem.text(title: story, backgroundColor: AppColors.grayColor);
      }
      else{
        return StoryItem.pageImage(url: story, controller: controller,duration: Duration(seconds: 5));
      }
     }

   }).toList();


    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Stack(
        children: [
          
          StoryView(
          storyItems: storyItems,
          controller: controller,
          onComplete: () => Navigator.pop(context),
            ),
          Positioned(
            top: 40,

            child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.secondaryColor,))
            ),
            ]
      ),
    );
  }
}
