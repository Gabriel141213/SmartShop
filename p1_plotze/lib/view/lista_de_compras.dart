// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';
import 'package:p1_plotze/itens_repository.dart';
import 'package:p1_plotze/view/subitens_list.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<Item> itens = ItensRepository.tabela;
  final TextEditingController nomeItemEdit = TextEditingController();
  final TextEditingController nomeItemNew = TextEditingController();
  Widget _buildListItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubItensList(itens[index]),
          ),
        );
      },
      child: Dismissible(
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
            itens.removeAt(index);
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
                color: Color.fromARGB(255, 223, 222, 222),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            leading: const Icon(Icons.list, size: 32),
            title: Text(
              itens[index].titulo,
              style: TextStyle(fontSize: 18),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, size: 28),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Editar lista ${itens[index].titulo}'),
                          content: TextFormField(
                            controller: nomeItemEdit,
                            decoration: InputDecoration(
                              hintText: 'Digite o novo nome',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                nomeItemEdit.clear();
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancelar'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  itens[index].titulo = nomeItemEdit.text;
                                  nomeItemEdit.clear();
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de compras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemCount: itens.length,
                itemBuilder: _buildListItem,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text("Adicionar"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Adicionar nova lista'),
                      content: TextFormField(
                        controller: nomeItemNew,
                        decoration: InputDecoration(
                          hintText: 'Digite o nome da lista de compras',
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              itens.add(Item(nomeItemNew.text, []));
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
