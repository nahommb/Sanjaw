import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/review/presentation/provider/previous_mathes_provider.dart';

class ReviewScreen extends ConsumerStatefulWidget {

  // static String routeName = 'review_screen';

  const ReviewScreen({super.key});

  @override
  ConsumerState<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends ConsumerState<ReviewScreen> {

  @override
  Widget build(BuildContext context) {

    final asyncData = ref.watch(previousMachesListProvider);
    
    return Scaffold(
      body: asyncData.when(data: (data){
      // print(data[0].homeTeam);
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context,index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Text(data[index].matchType ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
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
                  Text(data[index].homeTeam,style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('${data[index].homeScore}'),
                  Text('vs'),
                  Text('${data[index].awayScore}'),
                  Text(data[index].awayTeam,style: TextStyle(fontWeight: FontWeight.bold),),
                  
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
      });
      }, 
      error: (_,_) => Text(''), 
      loading: ()=> Center(child: CircularProgressIndicator(),)
      ) 
 ,
      
    );
  }
}