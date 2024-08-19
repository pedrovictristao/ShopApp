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

//   bool _mostrarFavoritos = false;

//   List<Produto> get itens {
//     if (_mostrarFavoritos) {
//       return _itens.where((prod) => prod.isFavorite).toList();
//     }
//     return [..._itens];
//   }

//   void mostrarFavoritos() {
//     _mostrarFavoritos = true;
//     notifyListeners();
//   }

//   void mostrarTodos() {
//     _mostrarFavoritos = false;
//     notifyListeners();
//   }