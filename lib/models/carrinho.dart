import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/models/carrinho_item.dart';
import 'package:shop_app/models/produto.dart';

class Carrinho with ChangeNotifier {
  Map<String, CarrinhoItem> _itens = {};

  Map<String, CarrinhoItem> get itens {
    return {..._itens};
  }

  int get contarItens {
    return _itens.length;
  }

  double get quantidadeTotal {
    double total = 0.0;
    _itens.forEach((key, carrinhoItem) {
      total += carrinhoItem.preco * carrinhoItem.quantidade;
    });
    return total;
  }

  void addItem(Produto produto) {
    if (_itens.containsKey(produto.id)) {
      _itens.update(
        produto.id,
        (itemExistente) => CarrinhoItem(
          id: itemExistente.id,
          produtoID: itemExistente.produtoID,
          nome: itemExistente.nome,
          quantidade: itemExistente.quantidade + 1,
          preco: itemExistente.preco,
        ),
      );
    } else {
      _itens.putIfAbsent(
        produto.id,
        () => CarrinhoItem(
          id: Random().nextDouble().toString(),
          produtoID: produto.id,
          nome: produto.nome,
          quantidade: 1,
          preco: produto.preco,
        ),
      );
    }
    notifyListeners();
  }

  void removerItem(String produtoID) {
    _itens.remove(produtoID);
    notifyListeners();
  }

  void limparLista() {
    _itens = {};
    notifyListeners();
  }
}
