import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/item_carrinho_widget.dart';
import 'package:shop_app/models/carrinho.dart';

class PageCarrinho extends StatelessWidget {
  const PageCarrinho({super.key});

  @override
  Widget build(BuildContext context) {
    final Carrinho carrinho = Provider.of(context);
    final itens = carrinho.itens.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Carrinho',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Somente para dar espaçamento entre "Total" e o valor em R$
                  const SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Text(
                      'R\$ ${carrinho.quantidadeTotal}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: const Text('Comprar'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (ctx, i) =>
                  ItemCarrinhoWidget(carrinhoItem: itens[i]),
            ),
          ),
        ],
      ),
    );
  }
}
