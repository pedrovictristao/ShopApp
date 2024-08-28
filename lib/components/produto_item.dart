import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/produto.dart';
import 'package:shop_app/models/produto_lista.dart';
import 'package:shop_app/utils/rotas.dart';

class ProdutoItem extends StatelessWidget {
  const ProdutoItem(this.produto, {super.key});

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(produto.imagemURL),
      ),
      title: Text(produto.nome),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Rotas.PAGINA_FORM_PRODUTO, arguments: produto);
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text(
                      'Excluir produto?',
                      style:
                          TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                        'O produto será removido e não será possível restaurá-lo, deseja continuar?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: const Text('Não'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                ).then((onValue) {
                  if (onValue ?? false) {
                    Provider.of<ProdutoLista>(context, listen: false).removerProduto(produto);
                  }
                });
              },
              color: Colors.redAccent,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
