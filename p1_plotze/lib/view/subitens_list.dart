import 'package:flutter/material.dart';
import 'package:p1_plotze/itens.dart';

class SubItensList extends StatefulWidget {
  final Item item;

  SubItensList(this.item, {Key? key}) : super(key: key);

  @override
  State<SubItensList> createState() => _SubItensListState();
}

class _SubItensListState extends State<SubItensList> {
  final TextEditingController _nomeItemNew = TextEditingController();
  final TextEditingController _qtdItemNew = TextEditingController();
  final TextEditingController _categoriaNew = TextEditingController();
  final TextEditingController _notaNew = TextEditingController();
  final TextEditingController _nomeItemEdit = TextEditingController();
  final TextEditingController _qtdItemEdit = TextEditingController();
  final TextEditingController _categoriaEdit = TextEditingController();
  final TextEditingController _notaEdit = TextEditingController();
  final TextEditingController pesquisa = TextEditingController();

  late List<ItemQtdComprado> filteredSubitens;

  @override
  void initState() {
    filteredSubitens = widget.item.subitens;
    super.initState();
  }

  void filterList(String query) {
    setState(() {
      filteredSubitens = widget.item.subitens.where((subitem) {
        final titleLower = subitem.item.toLowerCase();
        final queryLower = query.toLowerCase();
        return titleLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: pesquisa,
                onChanged: filterList,
                decoration: const InputDecoration(
                  labelText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemCount: filteredSubitens.length,
                itemBuilder: (context, index) {
                  final subitem = filteredSubitens[index];
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
                        final removedItem = filteredSubitens[
                            index]; // Captura o item a ser removido
                        widget.item.subitens.remove(
                            removedItem); // Remove o item da lista original
                        filteredSubitens
                            .removeAt(index); // Remove o item da lista filtrada
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
                        leading: const Icon(Icons.shopping_bag),
                        title: Text(subitem.item),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Quantidade: ${subitem.qtd}'),
                            Text('Categoria: ${subitem.categoria}'),
                            Text('Nota: ${subitem.nota}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _nomeItemEdit.text = subitem.item;
                                _qtdItemEdit.text = subitem.qtd.toString();
                                _categoriaEdit.text = subitem.categoria;
                                _notaEdit.text = subitem.nota;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // Retorna o AlertDialog
                                    return AlertDialog(
                                      title: const Text(
                                          'Editar itens da lista de compras'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextFormField(
                                            controller: _nomeItemEdit,
                                            decoration: const InputDecoration(
                                              hintText: 'Nome do item',
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _qtdItemEdit,
                                            decoration: const InputDecoration(
                                              hintText: 'Quantidade do item',
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _categoriaEdit,
                                            decoration: const InputDecoration(
                                              hintText: 'Categoria do item',
                                            ),
                                          ),
                                          TextFormField(
                                            controller: _notaEdit,
                                            decoration: const InputDecoration(
                                              hintText: 'Notas do item item',
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            _nomeItemEdit.clear();
                                            _qtdItemEdit.clear();
                                            _categoriaEdit.clear();
                                            _notaEdit.clear();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              subitem.item = _nomeItemEdit.text;
                                              subitem.qtd = double.parse(
                                                  _qtdItemEdit.text);
                                              subitem.categoria =
                                                  _categoriaEdit.text;
                                              subitem.nota = _notaEdit.text;
                                              _nomeItemEdit.clear();
                                              _qtdItemEdit.clear();
                                              _categoriaEdit.clear();
                                              _notaEdit.clear();
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              //fillColor: Colors.blue,
                              value: subitem.comprado,
                              onChanged: (bool? value) {
                                setState(() {
                                  subitem.comprado = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // Retorna o AlertDialog
                          return AlertDialog(
                            title: const Text(
                                'Adicionar novo item a lista de compras'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: _nomeItemNew,
                                  decoration: const InputDecoration(
                                    hintText: 'Nome do item',
                                  ),
                                ),
                                TextFormField(
                                  controller: _qtdItemNew,
                                  decoration: const InputDecoration(
                                    hintText: 'Quantidade do item',
                                  ),
                                ),
                                TextFormField(
                                  controller: _categoriaNew,
                                  decoration: const InputDecoration(
                                    hintText: 'Categoria do item',
                                  ),
                                ),
                                TextFormField(
                                  controller: _notaNew,
                                  decoration: const InputDecoration(
                                    hintText: 'Notas do item item',
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  _nomeItemEdit.clear();
                                  _qtdItemEdit.clear();
                                  _categoriaEdit.clear();
                                  _notaEdit.clear();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget.item.subitens.add(
                                      ItemQtdComprado(
                                          _nomeItemNew.text,
                                          double.parse(_qtdItemNew.text),
                                          _categoriaNew.text,
                                          _notaNew.text,
                                          false),
                                    );
                                    _nomeItemNew.clear();
                                    _qtdItemNew.clear();
                                    _categoriaNew.clear();
                                    _notaNew.clear();
                                    filterList(pesquisa.text);
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
