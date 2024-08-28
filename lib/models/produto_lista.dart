import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/data/dados_falsos.dart';
import 'package:shop_app/models/produto.dart';

class ProdutoLista with ChangeNotifier {
  final List<Produto> _itens = produtosFalsos;

  List<Produto> get itens => [..._itens];
  List<Produto> get itensFavoritos => _itens.where((prod) => prod.isFavorite).toList();

  int get contarItens {
    return _itens.length;
  }

  void addProduto(Produto produto) {
    _itens.add(produto);
    notifyListeners();
  }

  void salvarProduto(Map<String, Object> data) {
    bool temID = data['id'] != null;

    final produto = Produto(
      id: temID ? data['id'] as String : Random().nextDouble().toString(),
      nome: data['nome'] as String,
      descricao: data['descricao'] as String,
      preco: data['preco'] as double,
      imagemURL: data['imagemURL'] as String,
    );
    if (temID) {
      atualizarProduto(produto);
    } else {
      addProduto(produto);
    }
  }

  void atualizarProduto(Produto produto) {
    int index = _itens.indexWhere((p) => p.id == produto.id);

    if (index >= 0) {
      _itens[index] = produto;
      notifyListeners();
    }
  }

  void removerProduto(Produto produto) {
    int index = _itens.indexWhere((p) => p.id == produto.id);

    if (index >= 0) {
      _itens.removeWhere((p) => p.id == produto.id);
      notifyListeners();
    }
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