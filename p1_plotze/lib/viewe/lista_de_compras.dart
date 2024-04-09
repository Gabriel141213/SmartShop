// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';
import 'package:p1_plotze/itens_repository.dart';
import 'package:p1_plotze/viewe/itens_list.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<Item> itens = ItensRepository.tabela;
  Widget _itemLista(BuildContext context, int index) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 159, 217, 240),
        elevation: 5, // Elevação do botão quando ativado
        padding: EdgeInsets.symmetric(
            vertical: 12, horizontal: 24), // Espaçamento interno do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Borda arredondada
        ),
        minimumSize: Size(150, 40), // Tamanho mínimo do botão
      ),
      child: Text(itens[index].titulo),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItensList(itens[index]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de compras'),
      ),
      backgroundColor: Color.fromARGB(255, 239, 240, 195),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Número de colunas na grade
                      crossAxisSpacing: 16.0, // Espaçamento entre colunas
                      mainAxisSpacing: 16.0, // Espaçamento entre linhas
                    ),
                    itemBuilder: _itemLista,
                    itemCount: itens.length,
                  ),
                ),
                ElevatedButton(
                  child: Text("Adicionar"),
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
