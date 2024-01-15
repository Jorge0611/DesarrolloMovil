import 'package:flutter/material.dart';

class CardThree extends StatelessWidget {
  const CardThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          borderOnForeground: true,
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/mag2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null,
              ),
              Container(
                color: Colors.black.withOpacity(0.75),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.book, size: 40),
                    const SizedBox(height: 10),
                    const Text(
                      'Recipe Trends',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 80),
                    Wrap(
                      spacing: 10.0,
                      children: [
                        Chip(
                          label: const Text('Healthy'),
                          onDeleted: () {
                            debugPrint("Delete chip");
                          },
                        ),
                        Chip(
                          label: const Text('Vegan'),
                          onDeleted: () {
                            debugPrint("Delete chip");
                          },
                        ),
                        const Chip(
                          label: Text('Carrots'),
                        ),
                        const Chip(
                          label: Text('Carrots'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
