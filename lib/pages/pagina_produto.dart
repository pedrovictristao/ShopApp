import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/app_drawer.dart';
import 'package:shop_app/components/produto_item.dart';
import 'package:shop_app/models/produto_lista.dart';
import 'package:shop_app/utils/rotas.dart';

class PaginaProduto extends StatelessWidget {
  const PaginaProduto({super.key});

  @override
  Widget build(BuildContext context) {
    final ProdutoLista produtos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Gerenciar produtos',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Rotas.PAGINA_FORM_PRODUTO);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: produtos.contarItens,
          itemBuilder: (ctx, i) => Column(
            children: [
              ProdutoItem(produtos.itens[i]),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
