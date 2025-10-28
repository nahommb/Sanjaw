import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset(
        'assets/icons/logo_icon.svg',
        width: 100,
        height: 40,
        color: AppColors.primaryColor,
      ),centerTitle: true,),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            color: AppColors.primaryColor,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline_outlined,color: AppColors.primaryColor,),
          label: 'Live',
        
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings), 
          label: 'Settings',),
        
      ]),
    );
  }
}