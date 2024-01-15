import 'package:chat_app/config/theme/app_theme.dart';
import 'package:chat_app/providers/chat_provider.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  final focusNode = FocusNode();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpeg'),
              ),
              SizedBox(width: 10),
              Text('Michael'),
            ],
          ),
        ),
        body: const ChatScreen(),
      ),
    );
  }
}
