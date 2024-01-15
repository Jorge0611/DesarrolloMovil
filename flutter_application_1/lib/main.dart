import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/friend_bubble.dart';
import 'package:flutter_application_1/widgets/user_bubble.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Michael'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Container(
            alignment: Alignment.center,
            child: Row(children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
              const SizedBox(width: 10),
              Text(title),
            ])),
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        for (var i = 0; i < 10; i++)
          Column(
            children: [
              UserBubble(
                message: 'Hello World $i',
              ),
              const SizedBox(height: 10),
            ],
          ),
        for (var i = 0; i < 10; i++)
          const Column(
            children: [
              FriendBubble(
                message: 'Hello Friend',
              ),
              SizedBox(height: 10),
            ],
          )
      ]),
    );
  }
}
