import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/live/presentation/widgets/live_commenetator.dart';
import 'package:sanjaw/features/live/presentation/widgets/livestream.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      body: Center(
        child:Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight*0.015),
            Text(
              'Live Stream',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: AppColors.primaryColor),
            ),
            SizedBox(height: 20),
            // Container(
            //   // width: MediaQuery.of(context).size.width * 0.9,
            //   // padding: EdgeInsets.all(2.0),
            //   // decoration: BoxDecoration(
            //   //   border: Border.all(color: AppColors.primaryColor, width: 2),
            //   //   borderRadius: BorderRadius.circular(2),
            //   // ),
            //   height: screenHeight * 0.3,
            //   child: LiveYouTubeVideo(),
            // ),
            
           Expanded(child: LiveCommenetator()),
          ],
        ),

      ),
    );
  }
}