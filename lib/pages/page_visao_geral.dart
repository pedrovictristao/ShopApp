import 'package:flutter/material.dart';
import '../components/grid_produto.dart';

class Visaogeral extends StatelessWidget {
  const Visaogeral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loja Virtual',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: const GridProduto(),
    );
  }
}
