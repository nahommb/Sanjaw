import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/data/models/match_day_model.dart';
import 'package:intl/intl.dart';
import 'package:sanjaw/features/main/presentation/provider/nightmood_provider.dart';

class CardScroller extends ConsumerStatefulWidget {

  final List<MatchDayModel> matchDays;
  const CardScroller({super.key, required this.matchDays});

  @override
  ConsumerState<CardScroller> createState() => _CardScrollerState();
}

class _CardScrollerState extends ConsumerState<CardScroller> {
  @override
  Widget build(BuildContext context) {
    final isNight = ref.watch(nightmoodProvider);
    return Container(
      // width: 400,
      // padding: EdgeInsets.only(left: 10),
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.matchDays.length,
        itemBuilder: (context, index) {
        
        // final dateTime = DateTime.parse(matchDays[index].matchDate!);
        final formattedDate = DateFormat('dd MMM').format(widget.matchDays[index].matchDate!);
        final timeFormatted = DateFormat('hh:mm a').format(widget.matchDays[index].matchDate!);
        Text(formattedDate);

        return Card(
          child: Row(
            children: [
              Container(
                // width: 280,
                height: 130,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isNight?Colors.black:Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: AppColors.secondaryColor,
                      width: 10
                    )
                  ),
                 boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryColor,
                    blurRadius: 2,
                    spreadRadius: 0.5,
                    offset: Offset(0, 1)
                  )
                 ]
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedDate,style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('${widget.matchDays[index].eventType}'),
                        Column(
                          children: [
                            Text('${widget.matchDays[index].homeTeam}'),
                            Text('vs'),
                            Text('${widget.matchDays[index].awayTeam}'),
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
                        Text('${widget.matchDays[index].venue}!'),
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