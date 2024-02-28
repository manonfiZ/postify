import 'package:flutter/material.dart';
import 'package:postify/screens/base_screen.dart';
import 'package:postify/utils/constants.dart';

void main() async {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "postify",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'JosefinSansRegular',
          colorScheme: ColorScheme.fromSeed(
            seedColor: kAppColor,
          )),
      darkTheme: ThemeData(
          fontFamily: 'JosefinSansRegular',
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: kAppColor,
          )),
      themeMode: ThemeMode.system,
      home: const BaseScreen(),
    );
  }
}
