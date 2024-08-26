import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/carrinho.dart';
import 'package:shop_app/models/carrinho_item.dart';

class ItemCarrinhoWidget extends StatelessWidget {
  const ItemCarrinhoWidget({super.key, required this.carrinhoItem});

  final CarrinhoItem carrinhoItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(carrinhoItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: const Text(
                    'Tem certeza?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  content: const Text('Deseja remover o item do carrinho?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text('Não'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text('Sim'),
                    ),
                  ],
                ));
      },
      onDismissed: (_) {
        Provider.of<Carrinho>(
          context,
          listen: false,
        ).removerItem(carrinhoItem.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${carrinhoItem.preco}'),
                ),
              ),
            ),
            title: Text(carrinhoItem.nome),
            subtitle: Text(
                'Total: R\$ ${carrinhoItem.preco * carrinhoItem.quantidade}',
                style: const TextStyle(color: Colors.grey)),
            trailing: Text('${carrinhoItem.quantidade}x'),
          ),
        ),
      ),
    );
  }
}
