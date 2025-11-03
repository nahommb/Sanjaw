import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/data/models/match_day_model.dart';
import 'package:intl/intl.dart';

class CardScroller extends StatelessWidget {

  final List<MatchDayModel> matchDays;
  const CardScroller({super.key, required this.matchDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 400,
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: matchDays.length,
        itemBuilder: (context, index) {
        
        // final dateTime = DateTime.parse(matchDays[index].matchDate!);
        final formattedDate = DateFormat('dd MMM').format(matchDays[index].matchDate!);
        final timeFormatted = DateFormat('hh:mm a').format(matchDays[index].matchDate!);
        Text(formattedDate);

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
                padding: EdgeInsets.all(10),
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
                        Text(formattedDate,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        Text('${matchDays[index].eventType}'),
                        Column(
                          children: [
                            Text('${matchDays[index].homeTeam}'),
                            Text('vs'),
                            Text('${matchDays[index].awayTeam}'),
                          ],
                        ),
                      ],
                    ),
                    Container(width: 3,color: AppColors.primaryColor,margin: EdgeInsets.symmetric(horizontal: 10),),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kick Off'),
                        Text(timeFormatted),
                        Text('${matchDays[index].venue}!'),
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