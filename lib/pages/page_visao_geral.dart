import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/produto_lista.dart';
import '../components/grid_produto.dart';

enum OpcaoFiltro {
  favorito,
  todos,
}

class Visaogeral extends StatelessWidget {
  const Visaogeral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loja Virtual',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: OpcaoFiltro.favorito,
                child: Text('Favoritos'),
              ),
              const PopupMenuItem(
                value: OpcaoFiltro.todos,
                child: Text('Todos'),
              ),
            ],
            onSelected: (OpcaoFiltro valorSelecionado) {
              if (valorSelecionado == OpcaoFiltro.favorito) {
              } else {}
            },
          )
        ],
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: const GridProduto(),
    );
  }
}
