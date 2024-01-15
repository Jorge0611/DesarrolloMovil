import 'package:flutter/material.dart';

class FriendBubble extends StatelessWidget {
  const FriendBubble({super.key, required this.message, this.imageUrl});

  final String message;
  final String? imageUrl;

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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.only(bottom: 10),
              constraints: const BoxConstraints(maxWidth: 250.0),
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image(
                width: 250,
                alignment: Alignment.centerLeft,
                //image: const AssetImage('assets/images/snoop.gif'),
                image: NetworkImage(imageUrl ??
                    'https://yesno.wtf/assets/yes/0-c44a7789d54cbdcad867fb7845ff03ae.gif'),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const LinearProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
