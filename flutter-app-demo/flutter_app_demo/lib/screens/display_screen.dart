import 'package:flutter/material.dart';

import '../user.dart';

class DisplayScreen extends StatelessWidget {
  final User user;
  const DisplayScreen({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Username: ${user.uname}'),
          SizedBox(height: 10),
          Text('Password: ${user.pwd}'),

        ],
      ),
    );
  }
}
