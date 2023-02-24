import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color(0xFF202123),
        ),
        drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF202123)),
        scaffoldBackgroundColor: const Color(0xFF343541),
        cardColor: const Color(0xFF3e3f4b),
      ),
      home: const SafeArea(
        child: HomeScreen(),
      ),
    );
  }
}
