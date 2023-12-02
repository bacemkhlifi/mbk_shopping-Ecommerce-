import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbkshopping/screens/homeAppScreen.dart';

import 'controllers/BindingsController.dart';
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
      initialBinding: BaseBindings(),
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: HomeApp(),
    );
  }
}
