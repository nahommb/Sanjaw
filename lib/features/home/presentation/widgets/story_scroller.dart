import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/data/models/story_model.dart';
import 'package:sanjaw/features/home/presentation/widgets/story_view.dart';

class StoryScroller extends StatelessWidget {


  final List<StoryModel> story;
  const StoryScroller({super.key,required this.story});

  
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
           height: story.length > 0 ? 200:10,
          // padding: EdgeInsets.only(top: 10,left: 20),
          margin: EdgeInsets.only(bottom: 12),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: story.length,
            itemBuilder: (context, index) {
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
                   image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/200/300',scale: 0.5),
                    fit: BoxFit.cover,
                  ),
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
                          'Adane Girma ${index + 1}',
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