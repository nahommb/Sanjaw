import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class LiveCommenetator extends StatelessWidget {
  const LiveCommenetator({super.key});

  @override
  Widget build(BuildContext context) {

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Container(
      // height: 250,
      child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Streaming live from YouTube',
                    style: TextStyle(fontSize: 14, color: AppColors.secondaryColor),
                  ),
                  Text('Key Events'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('St George', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      Text('vs'),
                      Text('Ethiopian Coffee',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: screenHeight*0.3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                margin: EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('10 - Goal by Player 9'),
                                    Text('10 - Yellow Card to Player 5'),
                                    Text('10 - Half Time'),
                                    Text('11 - Second Half Started'),
                                    Text('11 - Substitution: Player 7 in, Player 10 out'),
                                    Text('11-  '),
                                  ],
                                ),
                              ),
                              Container(width: screenWidth*0.005, height: 100, color: AppColors.primaryColor,),
                              Container(
                                width: screenWidth * 0.4,
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                    Text('10:15 AM - Goal by Player 9'),
                                    Text('10:30 AM - Yellow Card to Player 5'),
                                    Text('10:45 AM - Half Time'),
                                    Text('11:00 AM - Second Half Started'),
                                    Text('11:20 AM - Substitution: Player 7 in, Player 10 out'),
                                    Text('11:45 AM - Full Time: St george 2 - 1 Ethiopian Coffee'),
                                    Text('11:00 AM - Second Half Started'),
                                    Text('11:20 AM - Substitution: Player 7 in, Player 10 out'),
                                    Text('11:45 AM - Full Time: St george 2 - 1 Ethiopian Coffee'),
                                    Text('11:00 AM - Second Half Started'),
                                    Text('11:20 AM - Substitution: Player 7 in, Player 10 out'),
                                    Text('11:45 AM - Full Time: St george 2 - 1 Ethiopian Coffee')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
      ),
    );
  }
}
