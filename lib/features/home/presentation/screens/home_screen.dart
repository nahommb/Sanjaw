import 'package:flutter/material.dart';
import 'package:sanjaw/features/home/presentation/widgets/card_scroller.dart';
import 'package:sanjaw/features/home/presentation/widgets/post_container.dart';
import 'package:sanjaw/features/home/presentation/widgets/story_scroller.dart';

class HomeScreen extends StatelessWidget {

   HomeScreen({super.key});

  List<Widget> postList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StoryScroller(),
            // Container(height: 300,),
            CardScroller(),
            Container(
              margin: EdgeInsets.only(top: 18,),
             padding: EdgeInsets.all(8),
             child: Text("What's New",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            PostContainer()
          ],
        ),
      ),
    );
  }
}