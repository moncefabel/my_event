import 'package:flutter/material.dart';

import '../lib/friend_request_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Screen',
      home: FriendRequestView(),
    );
  }
}
