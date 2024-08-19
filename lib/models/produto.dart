import 'package:flutter/material.dart';

class Produto with ChangeNotifier {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final String imagemURL;
  bool isFavorite;

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imagemURL,
    this.isFavorite = false,
  });

  void alternarFavorito() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
