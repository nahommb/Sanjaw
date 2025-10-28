import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key});


 Widget widgetList (){

  List<Widget> cards = [];

   for (int i =0; i<3; i++){
      cards.add(
        Card(
          child: Container(
            width: double.infinity,
            // height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Image.network('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BvcnR8ZW58MHx8MHx8fDA%3D&w=1000&q=80',),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
                )
              ] 
              ,
            ),
          ),
        ),
      );
   }
    return Column(
      children: [
        ...cards
        ],
    );
 }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: widgetList()
      );
  }
}