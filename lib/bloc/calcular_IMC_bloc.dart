import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalcularIMCBloc {
  final BuildContext context;
  var resultado = '';
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  CalcularIMCBloc(this.context);

  void calcular() {
    final peso = double.parse(pesoController.text);
    final altura = double.parse(alturaController.text) /
        100; // Convertendo altura para metros
    final imc = peso / (altura * altura);

    if (imc < 18.5) {
      resultado = 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      resultado = 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      resultado = 'Sobrepeso';
    } else if (imc >= 30 && imc < 34.9) {
      resultado = 'Obesidade Grau 1';
    } else if (imc >= 35 && imc < 39.9) {
      resultado = 'Obesidade Grau 2';
    } else {
      resultado = 'Obesidade Grau 3';
    }

    _mostrarResultado();
  }

  void _mostrarResultado() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado do IMC'),
          content: Text(resultado),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
