import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';
import 'package:p1_plotze/viewe/subitem_edit.dart';

// ignore: must_be_immutable
class ItensList extends StatefulWidget {
  Item item;
  ItensList(this.item, {super.key});

  @override
  State<ItensList> createState() => _ItensListState();
}

class _ItensListState extends State<ItensList> {
  final TextEditingController _nomeItem = TextEditingController();
  final TextEditingController _qtdItem = TextEditingController();

  //const ItensList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.titulo),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 241, 157, 148),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Icon(Icons.remove_circle_sharp),
                        )
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      widget.item.subitens.removeAt(index);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(255, 25, 178, 238),
                          Color.fromARGB(255, 247, 250, 75)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                              255, 223, 222, 222), // Cor da sombra
                          spreadRadius: 5, // Raio de propagação da sombra
                          blurRadius: 7, // Raio de desfoque da sombra
                          offset: Offset(0, 3), // Deslocamento da sombra
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_bag),
                      title: Text(widget.item.subitens[index][0]),
                      subtitle: Text(widget.item.subitens[index][1]),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit), // Ícone de edição
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SubItemForm(widget.item, index),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              widget.item.subitens[index] =
                                  result as List<String>;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                );
              },
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemCount: widget.item.subitens.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nomeItem,
                    decoration:
                        const InputDecoration(labelText: 'Novo Subitem'),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _qtdItem,
                    decoration: const InputDecoration(labelText: 'Quantidade'),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Adiciona o novo subitem à lista de subitens do item
                      widget.item.subitens.add([_nomeItem.text, _qtdItem.text]);
                      // Limpa o campo de texto
                      _nomeItem.clear();
                    });
                  },
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
