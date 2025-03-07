import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_push_noti_test/api/firebase_api.dart';
import 'package:firebase_push_noti_test/firebase_options.dart';
import 'package:firebase_push_noti_test/pages/home_page.dart';
import 'package:firebase_push_noti_test/pages/notification_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      navigatorKey: navigatorKey,
      routes: {"/notification_page": (context) => NotificationPage()},
    );
  }
}
