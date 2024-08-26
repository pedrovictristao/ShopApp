import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/ordem.dart';

class OrdemWidget extends StatefulWidget {
  const OrdemWidget({super.key, required this.ordem});

  final Ordem ordem;

  @override
  State<OrdemWidget> createState() => _OrdemWidgetState();
}

class _OrdemWidgetState extends State<OrdemWidget> {
  bool _expandir = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.ordem.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.ordem.data),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _expandir = !_expandir;
                });
              },
              icon: const Icon(Icons.expand_more),
            ),
          ),
          if (_expandir)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: (widget.ordem.produtos.length * 22.0) + 10,
              child: ListView(
                children: widget.ordem.produtos.map(
                  (produto) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          produto.nome,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${produto.quantidade}x R\$ ${produto.preco}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
