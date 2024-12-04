import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/Pages/homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set system UI overlay style for transparent status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.dark, // Status bar icons' brightness (optional)
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamify',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}
