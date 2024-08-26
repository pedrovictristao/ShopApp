import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de produto'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocus);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Preço'),
              textInputAction: TextInputAction.next,
              focusNode: _priceFocus,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocus);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              textInputAction: TextInputAction.done,
              focusNode: _descriptionFocus,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
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
                      child: Image.asset(_imageURLControler.text),
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
