import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/grid_produto_item.dart';
import 'package:shop_app/models/produto.dart';
import 'package:shop_app/models/produto_lista.dart';

class GridProduto extends StatelessWidget {
  final bool mostrarFavoritos;

  const GridProduto(this.mostrarFavoritos, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProdutoLista>(context);
    final List<Produto> produtosCarregados =
        mostrarFavoritos ? provider.itensFavoritos : provider.itens;

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
        child: const GridProdutoItem(),
      ),
    );
  }
}
