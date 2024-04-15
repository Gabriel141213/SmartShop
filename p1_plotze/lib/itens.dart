//class Item {
//  String titulo;
//  List<List<String>> subitens;
//
//  Item(this.titulo, this.subitens);
//}

class Item {
  String titulo;
  List<ItemQtdComprado> subitens;

  Item(this.titulo, this.subitens);
}

class ItemQtdComprado {
  String item;
  double qtd;
  String categoria;
  String nota;
  bool comprado;

  ItemQtdComprado(
      this.item, this.qtd, this.categoria, this.nota, this.comprado);
}
