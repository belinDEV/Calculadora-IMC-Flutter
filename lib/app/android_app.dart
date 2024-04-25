import 'package:trabalho/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Peso x Altura',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
