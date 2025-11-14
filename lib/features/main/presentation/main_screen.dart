import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanjaw/features/live/presentation/screens/live_screen.dart';
import 'package:sanjaw/features/players/presentation/screens/players_screen.dart';
import 'package:sanjaw/features/review/presentation/review_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



// final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   String? _token;

  @override
  void initState() {
    super.initState();
    // _initFCM();
  }

  // Future<void> _initFCM() async {
  //   // 1️⃣ Request notification permission (important for iOS)
  //   await _messaging.requestPermission();

  //   // 2️⃣ Get FCM token
  //   String? token = await _messaging.getToken();
  //   print("✅ FCM Token: $token");

  //   setState(() {
  //     _token = token;
  //   });

  //   // 3️⃣ Listen for messages when app is in foreground
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print("📩 Message received: ${message.notification?.title}");
  //   });
  // }



  int currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    LiveScreen(),
    ReviewScreen(),
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
          icon: Icon(Icons.restore_outlined,color: AppColors.secondaryColor),
          label: 'Review',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: AppColors.secondaryColor), 
          label: 'Settings',),
        
      ]),
    );
  }
}