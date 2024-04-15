import 'package:p1_plotze/itens.dart';

class ItensRepository {
  static List<Item> tabela = [
    Item(
      'Confraternização',
      [
        ItemQtdComprado(
            'Bebidas', 2, "Bebidas", "Comprar cerveja e refrigerantes", false),
        ItemQtdComprado('Salgadinhos', 3, "Salgadinhos",
            "Comprar salgados variados", false),
        ItemQtdComprado(
            'Doces', 2, "Doces", "Comprar doces e sobremesas", false),
      ],
    ),
    Item(
      'Festa',
      [
        ItemQtdComprado(
            'Decoração', 1, "Decoração", "Comprar balões e enfeites", false),
        ItemQtdComprado(
            'Petiscos', 2, "Petiscos", "Comprar petiscos para a festa", false),
        ItemQtdComprado('Música', 1, "Entretenimento",
            "Preparar playlist de músicas", false),
      ],
    ),
    Item(
      'Churrasco',
      [
        ItemQtdComprado(
            'Carnes', 1, "Carnes", "Comprar carnes variadas", false),
        ItemQtdComprado('Acompanhamentos', 1, "Acompanhamentos",
            "Comprar saladas e acompanhamentos", false),
        ItemQtdComprado(
            'Bebidas', 1, "Bebidas", "Comprar cervejas e refrigerantes", false),
      ],
    ),
    Item(
      'Compras da Semana',
      [
        ItemQtdComprado(
            'Frutas', 1, "Alimentos", "Comprar frutas frescas", false),
        ItemQtdComprado(
            'Verduras', 1, "Alimentos", "Comprar verduras e legumes", false),
        ItemQtdComprado('Produtos de Limpeza', 1, "Limpeza",
            "Comprar produtos de limpeza", false),
      ],
    ),
    Item(
      'Viagem',
      [
        ItemQtdComprado('Passagens', 1, "Viagem", "Comprar passagens", false),
        ItemQtdComprado(
            'Hospedagem', 1, "Viagem", "Reservar hotel ou acomodação", false),
        ItemQtdComprado('Roupas', 1, "Roupas",
            "Fazer mala e comprar roupas necessárias", false),
      ],
    ),
    Item(
      'Aniversário',
      [
        ItemQtdComprado(
            'Bolo', 1, "Doces", "Encomendar bolo de aniversário", false),
        ItemQtdComprado('Presentes', 1, "Presentes",
            "Comprar presentes para o aniversariante", false),
        ItemQtdComprado('Decoração', 1, "Decoração",
            "Comprar decoração para a festa", false),
      ],
    ),
    Item(
      'Piquenique',
      [
        ItemQtdComprado('Cestas', 1, "Utensílios",
            "Preparar cestas para os alimentos", false),
        ItemQtdComprado('Toalhas', 1, "Utensílios",
            "Levar toalhas para o piquenique", false),
        ItemQtdComprado('Jogos', 1, "Entretenimento",
            "Levar jogos para se divertir", false),
      ],
    ),
    Item(
      'Acampamento',
      [
        ItemQtdComprado('Barracas', 1, "Equipamentos",
            "Montar barracas para dormir", false),
        ItemQtdComprado('Utensílios de Cozinha', 1, "Utensílios",
            "Levar utensílios para cozinhar", false),
        ItemQtdComprado(
            'Repelente', 1, "Saúde", "Levar repelente para mosquitos", false),
      ],
    ),
    Item(
      'Trabalho',
      [
        ItemQtdComprado('Material de Escritório', 1, "Material de Escritório",
            "Comprar materiais de escritório", false),
        ItemQtdComprado(
            'Lanche', 1, "Alimentos", "Levar lanche para o trabalho", false),
        ItemQtdComprado('Documentos', 1, "Documentos",
            "Verificar se os documentos necessários estão prontos", false),
      ],
    ),
  ];
}
