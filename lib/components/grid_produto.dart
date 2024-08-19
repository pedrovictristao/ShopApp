import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/produto_item.dart';
import 'package:shop_app/models/produto.dart';
import 'package:shop_app/models/produto_lista.dart';

class GridProduto extends StatelessWidget {
  //List<Produto>? produtosCarregados;

  const GridProduto({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProdutoLista>(context);
    List<Produto> produtosCarregados = provider.itens;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: produtosCarregados.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: produtosCarregados[i],
        child: const ProdutoItem(),
      ),
    );
  }
}
