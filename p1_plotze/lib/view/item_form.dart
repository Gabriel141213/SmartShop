import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';

class ItemForm extends StatefulWidget {
  final List<Item> itens;

  const ItemForm(this.itens, {super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeItem =
        TextEditingController(text: "Digite o nome da lista");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de sub-item'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nomeItem,
            decoration: const InputDecoration(labelText: 'Adicionar lista'),
          ),
          ElevatedButton(
              onPressed: () {
                widget.itens.add(Item(nomeItem.text, []));
                Navigator.pop(context, widget.itens);
              },
              child: const Text('Salvar'))
        ],
      ),
    );
  }
}
