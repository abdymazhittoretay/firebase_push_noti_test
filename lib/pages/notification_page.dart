import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _message =
        ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(title: Text("NotificationPage")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("${_message.notification!.title}"),
              Text("${_message.notification!.body}"),
              Text("${_message.data}"),
            ],
          ),
        ),
      ),
    );
  }
}
