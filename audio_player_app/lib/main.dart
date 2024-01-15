import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final assetsAudioPlayer = AssetsAudioPlayer();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AudioButton(audioName: "1"),
              AudioButton(audioName: "2", color: Colors.cyan),
              AudioButton(audioName: "3", color: Colors.pink),
              AudioButton(audioName: "4", color: Colors.yellow),
              AudioButton(audioName: "5", color: Colors.grey),
              AudioButton(audioName: "6", color: Colors.indigo),
              AudioButton(audioName: "7", color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioButton extends StatelessWidget {
  const AudioButton(
      {super.key, this.audioName = "1", this.color = Colors.blue});

  final String audioName;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: OutlinedButton(
            onPressed: () {
              assetsAudioPlayer.open(
                Audio("/assets/audios/$audioName.mp3"),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: Text("Play Audio $audioName")));
  }
}
