import 'package:flutter/material.dart';
import 'package:shop_app/models/produto.dart';

class ProdutoItem extends StatelessWidget {
  const ProdutoItem(this.produto, {super.key});

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(produto.imagemURL),
      ),
      title: Text(produto.nome),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              color: Colors.redAccent,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
