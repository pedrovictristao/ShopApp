import 'package:shop_app/models/carrinho_item.dart';

class Ordem {
  final String id;
  final double total;
  final List<CarrinhoItem> produtos;
  final DateTime data;

  Ordem(
      {required this.id,
      required this.total,
      required this.produtos,
      required this.data});
}
