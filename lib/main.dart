import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/produto_lista.dart';
import 'package:shop_app/pages/page_detalhes.dart';
import 'package:shop_app/pages/page_visao_geral.dart';
import 'package:shop_app/utils/rotas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProdutoLista(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Merriweather',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          canvasColor: Colors.blueGrey,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headlineSmall: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
        home: const Visaogeral(),
        routes: {Rotas.PAGE_DETALHES: (ctx) => const Detalhes()},
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
