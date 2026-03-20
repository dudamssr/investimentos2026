import 'package:flutter/material.dart';
import 'dart:math';

class Investimento extends StatefulWidget {
  const Investimento({super.key});

  @override
  State<Investimento> createState() => _InvestimentoState();
}

class _InvestimentoState extends State<Investimento> {
  final valorController = TextEditingController();
  final mesesController = TextEditingController();
  final taxaController = TextEditingController();

  double total = 0;
  double semJuros = 0;

  void calcular() {
    double valor = double.tryParse(valorController.text) ?? 0;
    int meses = int.tryParse(mesesController.text) ?? 0;
    double taxa = (double.tryParse(taxaController.text) ?? 0) / 100;

    semJuros = valor * meses;
    total = valor * pow((1 + taxa), meses);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Resultado"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Sem juros: R\$ ${semJuros.toStringAsFixed(2)}"),
            const SizedBox(height: 5),
            Text("Com juros: R\$ ${total.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9), // verde suave
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "Simulador de\nInvestimento",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                campo("Valor mensal", valorController),
                campo("Número de meses", mesesController),
                campo("Taxa de juros (%)", taxaController),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calcular,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 191, 255, 242),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Simular",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Sem juros: R\$ ${semJuros.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  "Com juros: R\$ ${total.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget campo(String label, controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Digite aqui",
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}