import 'package:flutter/material.dart';
import 'package:shop_app/models/produto.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({super.key});

  @override
  Widget build(BuildContext context) {
    final Produto produto =
        ModalRoute.of(context)?.settings.arguments as Produto;
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
      ),
    );
  }
}
