import 'package:flutter/material.dart';

class FriendBubble extends StatelessWidget {
  const FriendBubble({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image(
            image: const AssetImage('assets/images/snoop.gif'),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const LinearProgressIndicator();
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
