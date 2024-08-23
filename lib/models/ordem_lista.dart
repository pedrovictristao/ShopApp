import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/models/carrinho.dart';
import 'package:shop_app/models/ordem.dart';

class OrdemLista with ChangeNotifier {
  List<Ordem> _itens = [];

  List<Ordem> get itens {
    return [..._itens];
  }

  int get contarItens {
    return _itens.length;
  }

  void adicionarOrdem(Carrinho carrinho) {
    _itens.insert(
      0,
      Ordem(
        id: Random().nextDouble().toString(),
        total: carrinho.quantidadeTotal,
        produtos: carrinho.itens.values.toList(),
        data: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
