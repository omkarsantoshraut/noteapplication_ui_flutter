import 'package:flutter/material.dart';
import 'package:noteapplication_ui_flutter/pages/home_page.dart';

import 'package:noteapplication_ui_flutter/utils/constants/app_strings.dart' as app_strings;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_strings.appHeaderName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}