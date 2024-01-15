import 'package:flutter/material.dart';
import 'package:multi_store_app/views/buyers/screens/widgets/banner_widget.dart';
import 'package:multi_store_app/views/buyers/screens/widgets/category_text_widget.dart';
import 'package:multi_store_app/views/buyers/screens/widgets/search_input_widget.dart';
import 'package:multi_store_app/views/buyers/screens/widgets/welcome_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          WelcomeText(),
          SizedBox(height: 20),
          SearchField(),
          SizedBox(height: 20),
          BannerWidget(),
          SizedBox(height: 20),
          CategoryTextWidget()
        ],
      ),
    );
  }
}
