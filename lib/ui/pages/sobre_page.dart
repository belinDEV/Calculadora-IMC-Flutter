import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Sobre o App'),
            backgroundColor: Colors.blueAccent.shade700),
        body: Column(
          children: [
            const Text('Orlando belin Neto x RA 12549 '),
          ],
        ),
      ),
    );
  }
}
