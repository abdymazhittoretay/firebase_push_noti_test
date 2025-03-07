import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaginInstance =
      FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaginInstance.requestPermission();

    final fCMToken = await _firebaseMessaginInstance.getToken();

    print("Token: $fCMToken");
  }
}
