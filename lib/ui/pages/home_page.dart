import 'package:trabalho/bloc/calcular_combustivel_bloc.dart';
import 'package:trabalho/ui/pages/sobre_page.dart';
import 'package:trabalho/ui/widgets/campo_texto.dart';
import 'package:trabalho/ui/widgets/menu_lateral.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map> listaMenu;

  void _abrirSobre() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SobrePage()));
  }

  @override
  Widget build(BuildContext context) {
    final _calcBloc = CalcularIMCBloc(context);

    listaMenu = [
      {"Texto": "Calcular", "Clique": _calcBloc.calcular},
      {"Texto": "Sobre", "Clique": _abrirSobre}
    ];

    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_gas_station,
                color: Colors.white,
                size: 36,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Adicone seu peso e a sua altura',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: Colors.blueAccent.shade700,
        ),
        drawer: MenuLateral(listaItens: listaMenu),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _calcBloc.calcular();
            });
          },
          child: const Icon(
            Icons.local_gas_station,
            size: 34,
          ),
        ),
        body: Column(
          children: [
            CampoTexto(_calcBloc.pesoController, 'Peso', ''),
            CampoTexto(_calcBloc.alturaController, 'Altura', ''),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _calcBloc.calcular();
                  });
                },
                child: const Text('Calcular IMC')),
            Text(_calcBloc.resultado, style: const TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}
