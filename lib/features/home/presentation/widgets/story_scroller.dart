import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/core/helper/video_checker.dart';
import 'package:sanjaw/features/home/data/models/story_model.dart';
import 'package:sanjaw/features/home/presentation/widgets/story_view.dart';

class StoryScroller extends StatelessWidget {


  final List<StoryModel> story;
  const StoryScroller({super.key,required this.story});

 int decorationImageIndex(urls){
  int index = -1;
  for(int i= urls.length-1 ;i >= 0; i--){
    if(VideoChecker(urls[i])== 'image'){
      index = i;
    }
    else{
      index = -1;
    }
  }
  print('index ${index}');
  return index;
 }
  
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 8),
          child: Text('Good Morning',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        ),
        Container(
           height: story.isNotEmpty ? 200:10,
          // padding: EdgeInsets.only(top: 10,left: 20),
          margin: EdgeInsets.only(bottom: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: story.length,
            itemBuilder: (context, index) {
              int imageIndex =  decorationImageIndex(story[index].storyUrls);
              return GestureDetector(
                onTap: (){
                  print('story');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StoryViewPage(story_urls:story[index].storyUrls),));
                },
                child: Container(
                  width: 130,
                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  decoration: BoxDecoration(
                   color: AppColors.grayColor,
                   borderRadius: BorderRadius.circular(8),
                   border: Border.all(
                    color: AppColors.secondaryColor,
                    width: 2
                   ),                   
                   image:  imageIndex >=0 ? DecorationImage(
                    image: NetworkImage(story[index].storyUrls[imageIndex],scale: 0.5),
                    fit: BoxFit.cover,
                  ):null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                              Colors.black87,   
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          '${story[index].title}',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}