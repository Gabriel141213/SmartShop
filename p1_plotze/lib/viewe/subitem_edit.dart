import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';

class SubItemForm extends StatefulWidget {
  final Item item;
  final int subItemIdx;

  const SubItemForm(this.item, this.subItemIdx, {super.key});

  @override
  State<SubItemForm> createState() => _SubItemFormState();
}

class _SubItemFormState extends State<SubItemForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nomeItem =
        TextEditingController(text: widget.item.subitens[widget.subItemIdx][0]);
    final TextEditingController _qtdItem =
        TextEditingController(text: widget.item.subitens[widget.subItemIdx][1]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de sub-item'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nomeItem,
            decoration:
                const InputDecoration(labelText: 'Editar nome do Subitem'),
          ),
          TextField(
            controller: _qtdItem,
            decoration: const InputDecoration(
                labelText: 'Editar quantidade do Subitem'),
          ),
          ElevatedButton(
              onPressed: () {
                widget.item.subitens[widget.subItemIdx] = [
                  _nomeItem.text,
                  _qtdItem.text
                ];
                Navigator.pop(context, [_nomeItem.text, _qtdItem.text]);
              },
              child: const Text('Salvar'))
        ],
      ),
    );
  }
}
