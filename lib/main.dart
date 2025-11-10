import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/core/config/app_theme.dart';
import 'package:sanjaw/features/home/presentation/widgets/story_view.dart';
import 'package:sanjaw/features/main/presentation/main_screen.dart';
import 'package:sanjaw/features/players/presentation/screens/players_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// 🔔 Local notifications instance
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// 🧠 Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("📩 Background message received: ${message.notification?.title}");
}

// 🧩 Initialize local notifications
Future<void> _initLocalNotifications() async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings =
      InitializationSettings(android: androidSettings);

  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

// 📢 Show local notification
Future<void> _showNotification(RemoteMessage message) async {
  final notification = message.notification;
  final android = message.notification?.android;

  if (notification != null && android != null) {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title ?? 'Notification',
      notification.body ?? '',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel', // channel id
          'Default Channel', // channel name
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await _initLocalNotifications();

  // ✅ Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final messaging = FirebaseMessaging.instance;

  // 🔐 Request permission (especially needed for iOS)
  await messaging.requestPermission();

  // 🎯 Subscribe to topic (all users get this)
  await messaging.subscribeToTopic('live_updates');
  print("✅ Subscribed to topic: live_updates");

  // 🔥 Print FCM token (for debugging)
  final token = await messaging.getToken();
  print("📱 FCM Token: $token");

  // ⚡ Listen for foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("📬 Foreground message: ${message.notification?.title}");
    _showNotification(message);
  });

  // 🕊️ When user taps notification (app opened from background)
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("🚀 Notification tapped: ${message.notification?.title}");
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanjaw',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        PlayersScreen.routeName: (context) => const PlayersScreen(),
        // StoryViewPage.routeName: (context)=> const StoryViewPage(story_urls: story_urls)
      },
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
