import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/produto.dart';
import 'package:shop_app/utils/rotas.dart';

class ProdutoItem extends StatelessWidget {
  const ProdutoItem({super.key});

  // final Produto produto;

  @override
  Widget build(BuildContext context) {
    final produto = Provider.of<Produto>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Produto>(
            builder: (ctx, produto, _) => IconButton(
              onPressed: () {
                produto.alternarFavorito();
              },
              icon: Icon(
                  produto.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          ),
          title: Text(
            produto.nome,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Merriweather',
              fontSize: 9,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ),
        child: GestureDetector(
          child: Image.asset(
            produto.imagemURL,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              Rotas.PAGE_DETALHES,
              arguments: produto,
            );
          },
        ),
      ),
    );
  }
}
