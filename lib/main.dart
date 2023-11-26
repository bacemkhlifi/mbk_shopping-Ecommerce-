import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbkshopping/screens/homeAppScreen.dart';
import 'package:mbkshopping/screens/homeScreen.dart';
import 'package:mbkshopping/screens/login.dart';

import 'services/theme_services.dart';
import 'widgets/theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: HomeApp(),
      initialRoute: '/homeapp',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () =>  HomePage(),
        ),
        GetPage(
          name: '/homeapp',
          page: () => HomeApp(),
        ),
        // Define other pages/routes as needed
      ],
    );
  }
}
