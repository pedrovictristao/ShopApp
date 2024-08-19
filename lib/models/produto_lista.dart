import 'package:flutter/material.dart';
import 'package:shop_app/data/dados_falsos.dart';
import 'package:shop_app/models/produto.dart';

class ProdutoLista with ChangeNotifier {
  final List<Produto> _itens = produtosFalsos;
  List<Produto> get itens => [..._itens];

  void addProduto(Produto produto) {
    _itens.add(produto);
    notifyListeners();
  }
}
