import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sanjaw/core/config/app_theme.dart';
import 'package:sanjaw/features/main/presentation/main_screen.dart';
import 'package:sanjaw/features/players/presentation/screens/players_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// 1️⃣ Create a FlutterLocalNotificationsPlugin instance
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// 2️⃣ Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Background message: ${message.messageId}");
}

// 3️⃣ Initialize local notifications
Future<void> _initLocalNotifications() async {
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings =
      InitializationSettings(android: androidSettings);

  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

// 4️⃣ Show notification
Future<void> _showNotification(RemoteMessage message) async {
  final notification = message.notification;
  final android = message.notification?.android;

  if (notification != null && android != null) {
    await flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'default_channel', // channel id
          'Default Channel', // channel name
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Initialize local notifications
  await _initLocalNotifications();

  // Register background handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Request permissions (iOS)
  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();

  // Get FCM token
  final token = await messaging.getToken();
  print("🔥 FCM Token: $token");

  // Foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Foreground message: ${message.notification?.title}");
    _showNotification(message); // Show notification in status bar
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
        PlayersScreen.routeName: (context) => PlayersScreen(),
      },
      home: const MainScreen(),
    );
  }
}
