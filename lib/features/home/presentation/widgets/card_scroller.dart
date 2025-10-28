import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class CardScroller extends StatelessWidget {
  const CardScroller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 400,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
        return Card(
          child: Container(
            width: 300,
            height: 70,
            color: AppColors.primaryColor,
          ),
        );
      },
    ));
  }
}