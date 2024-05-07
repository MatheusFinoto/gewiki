// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../dtos/profession_ingredients_dto.dart';

class ProfessionIngredient {
  final int id;
  final String professionId;
  final String name;
  final double price;

  ProfessionIngredient({
    required this.id,
    required this.professionId,
    required this.name,
    required this.price,
  });

  ProfessionIngredient copyWith({
    int? id,
    String? professionId,
    String? name,
    double? price,
  }) {
    return ProfessionIngredient(
      id: id ?? this.id,
      professionId: professionId ?? this.professionId,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'professionId': professionId,
      'name': name,
      'price': price,
    };
  }

  factory ProfessionIngredient.fromMap(Map<String, dynamic> map) {
    return ProfessionIngredient(
      id: map['id'] as int,
      professionId: map['professionId'] as String,
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionIngredient.fromJson(String source) =>
      ProfessionIngredient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfessionIngredient(id: $id, professionId: $professionId, name: $name, price: $price)';
  }

  @override
  bool operator ==(covariant ProfessionIngredient other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.professionId == professionId &&
        other.name == name &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ professionId.hashCode ^ name.hashCode ^ price.hashCode;
  }

  factory ProfessionIngredient.fromDto(ProfessionIngredientDto dto) {
    return ProfessionIngredient(
      id: dto.id,
      professionId: dto.professionId,
      name: dto.name,
      price: dto.price,
    );
  }
}
