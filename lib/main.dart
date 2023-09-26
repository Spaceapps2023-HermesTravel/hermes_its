import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hermes-ITS',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
