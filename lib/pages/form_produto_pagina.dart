import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/produto.dart';
import 'package:shop_app/models/produto_lista.dart';

class FormProdutoPagina extends StatefulWidget {
  const FormProdutoPagina({super.key});

  @override
  State<FormProdutoPagina> createState() => _FormProdutoPaginaState();
}

class _FormProdutoPaginaState extends State<FormProdutoPagina> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageURLControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final argumento = ModalRoute.of(context)?.settings.arguments;

      if (argumento != null) {
        final produto = argumento as Produto;
        _formData['id'] = produto.id;
        _formData['nome'] = produto.nome;
        _formData['preco'] = produto.preco;
        _formData['descricao'] = produto.descricao;
        _formData['imagemURL'] = produto.imagemURL;

        _imageURLControler.text = produto.imagemURL;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();

    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool imagemUrlvalida(String url) {
    bool urlValida = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    return urlValida;
  }

  void _submitForm() {
    final ehValido = _formKey.currentState?.validate() ?? false;

    if (!ehValido) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProdutoLista>(context, listen: false).salvarProduto(_formData);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Formulário de produto',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_alt),
            onPressed: _submitForm,
          )
        ],
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                TextFormField(
                  initialValue: _formData['nome']?.toString(),
                  decoration: const InputDecoration(labelText: 'Nome'),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocus);
                  },
                  onSaved: (nome) => _formData['nome'] = nome ?? '',
                  validator: (_nome) {
                    final nome = _nome ?? '';

                    if (nome.trim().isEmpty) {
                      return 'Nome obrigatório.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['preco']?.toString(),
                  decoration: const InputDecoration(labelText: 'Preço'),
                  textInputAction: TextInputAction.next,
                  focusNode: _priceFocus,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocus);
                  },
                  onSaved: (preco) => _formData['preco'] = double.parse(preco ?? '0'),
                  validator: (_preco) {
                    final precoString = _preco ?? '-1';
                    final preco = double.tryParse(precoString) ?? -1;

                    if (preco <= 0) {
                      return 'Informe um preço válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  initialValue: _formData['descricao']?.toString(),
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  textInputAction: TextInputAction.done,
                  focusNode: _descriptionFocus,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onSaved: (descricao) => _formData['descricao'] = descricao ?? '',
                  validator: (_descricao) {
                    final descricao = _descricao ?? '';

                    if (descricao.trim().isEmpty) {
                      return 'Descrição obrigatório.';
                    }
                    return null;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'URL da imagem'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.url,
                        focusNode: _imageUrlFocus,
                        controller: _imageURLControler,
                        onFieldSubmitted: (_) => _submitForm(),
                        onSaved: (imagemURL) => _formData['imagemURL'] = imagemURL ?? '',
                        // validator: (_imagemURL) {
                        //   final imagemURL = _imagemURL ?? '';
                        //   if (imagemUrlvalida(imagemURL)) {
                        //     return 'Informe uma URL válida';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: _imageURLControler.text.isEmpty
                          ? const Text('Informe a URL da imagem!')
                          : FittedBox(
                              fit: BoxFit.cover,
                              child: Image.network(_imageURLControler.text),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
