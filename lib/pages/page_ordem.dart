import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/app_drawer.dart';
import 'package:shop_app/models/ordem_lista.dart';

class PageOrdem extends StatelessWidget {
  const PageOrdem({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdemLista ordens = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus pedidos'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: ordens.contarItens,
        itemBuilder: (ctx, i) => Text(
          ordens.itens[i].total.toString(),
        ),
      ),
    );
  }
}
