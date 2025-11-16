import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/core/config/app_colors.dart';
import 'package:sanjaw/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanjaw/features/live/presentation/screens/live_screen.dart';
import 'package:sanjaw/features/main/presentation/provider/nightmood_provider.dart';
import 'package:sanjaw/features/players/presentation/screens/players_screen.dart';
import 'package:sanjaw/features/review/presentation/screens/review_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {



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

//  bool isNightMood = true;

  @override
  Widget build(BuildContext context) {

    final isNight = ref.watch(nightmoodProvider);
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        onPressed: (){
       ref.read(nightmoodProvider.notifier).toggleMood();
      }, icon: Icon(isNight?Icons.wb_sunny_outlined:Icons.dark_mode_outlined)),title: SvgPicture.asset(
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
        // backgroundColor: Colors.white,
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
            colorFilter: ColorFilter.mode(
              isNight?AppColors.primaryColor:currentIndex == 0?AppColors.secondaryColor:Colors.black
             ,BlendMode.srcIn,),
            // color: isNight?AppColors.secondaryColor:Colors.black,
            
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline_outlined,),
          label: 'Live',
        
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restore_outlined,),
          label: 'Review',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings), 
          label: 'Settings',),
        
      ]),
    );
  }
}