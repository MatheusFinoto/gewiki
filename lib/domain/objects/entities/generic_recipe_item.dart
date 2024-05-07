// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:gw_wiki/domain/objects/dtos/generic_recipe_item_dto.dart';

class GenericRecipeItem {
  final int id;
  final int quantity;
  GenericRecipeItem({
    required this.id,
    required this.quantity,
  });

  GenericRecipeItem copyWith({
    int? id,
    int? quantity,
  }) {
    return GenericRecipeItem(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
    };
  }

  factory GenericRecipeItem.fromMap(Map<String, dynamic> map) {
    return GenericRecipeItem(
      id: map['id'] as int,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenericRecipeItem.fromJson(String source) =>
      GenericRecipeItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenericRecipeItem(id: $id, quantity: $quantity)';

  @override
  bool operator ==(covariant GenericRecipeItem other) {
    if (identical(this, other)) return true;

    return other.id == id && other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ quantity.hashCode;

  factory GenericRecipeItem.fromDto(GenericRecipeItemDto dto) {
    return GenericRecipeItem(
      id: dto.id,
      quantity: dto.quantity,
    );
  }
}
