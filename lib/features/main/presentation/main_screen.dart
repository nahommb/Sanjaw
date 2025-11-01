import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanjaw/features/live/presentation/screens/live_screen.dart';
import 'package:sanjaw/features/players/presentation/screens/players_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    LiveScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset(
        'assets/icons/logo_icon.svg',
        width: 100,
        height: 40,
        color: AppColors.primaryColor,
      ),centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.people,size: 30,),
          onPressed: () {
            print('clicked');
            Navigator.pushNamed(context, PlayersScreen.routeName);
          },
        ),
      ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) => setState(() {
          currentIndex = value;
        }),
        items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/logo_icon.svg',
            width: 24,
            height: 24,
            color: AppColors.secondaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline_outlined,color: AppColors.secondaryColor,),
          label: 'Live',
        
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,color: AppColors.secondaryColor),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: AppColors.secondaryColor), 
          label: 'Settings',),
        
      ]),
    );
  }
}