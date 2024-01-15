import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_flutter/pages/login/page.dart';
import 'package:getx_flutter/pages/register/page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery App',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage())
      ],
    );
  }
}
