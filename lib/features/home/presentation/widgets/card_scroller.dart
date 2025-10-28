import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class CardScroller extends StatelessWidget {
  const CardScroller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 400,
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
        return Card(
          child: Row(
            children: [
              Container(
                color: AppColors.secondaryColor,
                height: 130,
                width: 10,
              ),
              Container(
                // width: 280,
                height: 130,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.grayColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tue 28 Oct',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text('Ethiopian Premier League'),
                        Column(
                          children: [
                            Text('Saint George'),
                            Text('vs'),
                            Text('Fasil Kenema'),
                          ],
                        ),
                      ],
                    ),
                    Container(width: 3,color: AppColors.primaryColor,margin: EdgeInsets.symmetric(horizontal: 10),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kick Off'),
                        Text('19:30 PM'),
                        Text('Hawassa Stadium'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}