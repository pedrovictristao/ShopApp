import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/cracha.dart';
import 'package:shop_app/models/carrinho.dart';
import 'package:shop_app/utils/rotas.dart';
import '../components/grid_produto.dart';

enum OpcaoFiltro {
  favorito,
  todos,
}

class Visaogeral extends StatefulWidget {
  const Visaogeral({super.key});

  @override
  State<Visaogeral> createState() => _VisaogeralState();
}

class _VisaogeralState extends State<Visaogeral> {
  bool _mostrarFavoritos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loja Virtual',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: OpcaoFiltro.favorito,
                child: Text('Favoritos'),
              ),
              const PopupMenuItem(
                value: OpcaoFiltro.todos,
                child: Text('Todos'),
              ),
            ],
            onSelected: (OpcaoFiltro valorSelecionado) {
              setState(() {
                if (valorSelecionado == OpcaoFiltro.favorito) {
                  _mostrarFavoritos = true;
                } else {
                  _mostrarFavoritos = false;
                }
              });
            },
          ),
          Consumer<Carrinho>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Rotas.PAGE_CARRINHO);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            builder: (ctx, carrinho, child) => Cracha(
              valor: carrinho.contarItens.toString(),
              Colors.amber,
              child: child!,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: GridProduto(_mostrarFavoritos),
    );
  }
}
