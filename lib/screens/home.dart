import 'package:flutter/material.dart';
import 'investimento.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Investimento")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Abrir Simulador"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Investimento()),
            );
          },
        ),
      ),
    );
  }
}