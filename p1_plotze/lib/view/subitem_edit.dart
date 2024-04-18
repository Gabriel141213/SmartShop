import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';

class SubItemForm extends StatefulWidget {
  final ItemQtdComprado subitem;

  SubItemForm(this.subitem, {Key? key}) : super(key: key);

  @override
  State<SubItemForm> createState() => _SubItemFormState();
}

class _SubItemFormState extends State<SubItemForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _qtdController = TextEditingController();

  @override
  void initState() {
    _nomeController.text = widget.subitem.item;
    _qtdController.text = widget.subitem.qtd.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Subitem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome do Subitem'),
            ),
            TextField(
              controller: _qtdController,
              decoration: const InputDecoration(labelText: 'Quantidade'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.subitem.item = _nomeController.text;
                widget.subitem.qtd = double.parse(_qtdController.text);
                Navigator.pop(context, widget.subitem);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
