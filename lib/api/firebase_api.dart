import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_push_noti_test/main.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaginInstance =
      FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaginInstance.requestPermission();

    final fCMToken = await _firebaseMessaginInstance.getToken();

    print("Token: $fCMToken");

    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed(
      "/notification_page",
      arguments: message,
    );
  }

  Future<void> initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
