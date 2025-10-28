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
            height: 300,
            color: AppColors.grayColor,
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
      padding: EdgeInsets.all(10),
      child: widgetList()
      );
  }
}