import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    const double dividerGap = 20;
    const double avatarRadius = 36;

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  debugPrint("Menu pressed");
                },
                icon: const Icon(Icons.menu),
              ),
              const Spacer(),
              const Text("Layouts"),
              const Spacer(),
              const Icon(Icons.cloud_outlined),
            ],
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: const AssetImage("assets/gift3.jpeg"),
                  height: deviceHeight * 0.35,
                ),
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.all(dividerGap),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "My Birthday",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: dividerGap),
                      const Text(
                        "It's going to be a great birthday. We are going out for dinner at my favorite place, then watch a movie after we go to the gelateria for ice cream and espresso.",
                        style: TextStyle(),
                      ),
                      const Divider(height: dividerGap),
                      const Row(
                        children: [
                          Icon(Icons.sunny, color: Colors.orange),
                          SizedBox(width: dividerGap),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "81° Clear",
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "4500 San Alpho Drive, Dallas, TX United States",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: dividerGap),
                      Wrap(
                        spacing: 10,
                        children: [
                          for (int i = 1; i <= 7; i++)
                            Chip(
                              avatar: const Icon(
                                Icons.card_giftcard,
                                color: Colors.blue,
                              ),
                              label: Text("Gift $i"),
                            )
                        ],
                      ),
                      const Divider(height: dividerGap),
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/2126711929_ef763de2b3_w.jpg"),
                            radius: avatarRadius,
                          ),
                          SizedBox(width: dividerGap),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/3187380632_5056654a19_b.jpg"),
                            radius: avatarRadius,
                          ),
                          SizedBox(width: dividerGap),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/3187380632_5056654a19_b.jpg"),
                            radius: avatarRadius,
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Icon(Icons.cake),
                              Icon(Icons.star_outline),
                              Icon(Icons.music_note)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
