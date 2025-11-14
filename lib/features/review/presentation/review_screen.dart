import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class ReviewScreen extends StatelessWidget {

  // static String routeName = 'review_screen';

  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
      
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text('Ethiopian Cup',style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20,),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border:Border(
                  left: BorderSide(
                    color: AppColors.secondaryColor,
                    width: 6
                  ),
                  right: BorderSide(
                    color: AppColors.primaryColor,
                    width: 6
                  )
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Ethiopian Coffee',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('2'),
                  Text('vs'),
                  Text('2'),
                  Text('St George',style: TextStyle(fontWeight: FontWeight.bold),),
                  
                ],
              ),
            ),
            // Padding(
            // padding: EdgeInsetsGeometry.all(8),
            // child: Text('Vs'),
            // ),
            // Row(
            //   children: [
            //     Text('St George'),
            //     Text('2')
            //   ],
            // ),
          ],
        );
      }),
      
    );
  }
}