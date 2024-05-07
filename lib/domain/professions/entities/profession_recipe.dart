// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gw_wiki/domain/professions/dtos/profession_recipe_dto.dart';

import '../../objects/entities/generic_recipe_item.dart';

class ProfessionRecipe {
  final int id;
  final String name;
  final int expEarn;
  final int actvityPoints;
  final List<GenericRecipeItem> materials;
  final List<GenericRecipeItem> ingredients;
  final GenericRecipeItem result;
  ProfessionRecipe({
    required this.id,
    required this.name,
    required this.expEarn,
    required this.actvityPoints,
    required this.materials,
    required this.ingredients,
    required this.result,
  });

  ProfessionRecipe copyWith({
    int? id,
    String? name,
    int? expEarn,
    int? actvityPoints,
    List<GenericRecipeItem>? materials,
    List<GenericRecipeItem>? ingredients,
    GenericRecipeItem? result,
  }) {
    return ProfessionRecipe(
      id: id ?? this.id,
      name: name ?? this.name,
      expEarn: expEarn ?? this.expEarn,
      actvityPoints: actvityPoints ?? this.actvityPoints,
      materials: materials ?? this.materials,
      ingredients: ingredients ?? this.ingredients,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'expEarn': expEarn,
      'actvityPoints': actvityPoints,
      'materials': materials.map((x) => x.toMap()).toList(),
      'ingredients': ingredients.map((x) => x.toMap()).toList(),
      'result': result.toMap(),
    };
  }

  factory ProfessionRecipe.fromMap(Map<String, dynamic> map) {
    return ProfessionRecipe(
      id: map['id'] as int,
      name: map['name'] as String,
      expEarn: map['expEarn'] as int,
      actvityPoints: map['actvityPoints'] as int,
      materials: List<GenericRecipeItem>.from(
        (map['materials'] as List<int>).map<GenericRecipeItem>(
          (x) => GenericRecipeItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      ingredients: List<GenericRecipeItem>.from(
        (map['ingredients'] as List<int>).map<GenericRecipeItem>(
          (x) => GenericRecipeItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      result: GenericRecipeItem.fromMap(map['result'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionRecipe.fromJson(String source) =>
      ProfessionRecipe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfessionRecipe(id: $id, name: $name, materials: $materials, ingredients: $ingredients)';
  }

  @override
  bool operator ==(covariant ProfessionRecipe other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.materials, materials) &&
        listEquals(other.ingredients, ingredients);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        materials.hashCode ^
        ingredients.hashCode;
  }

  factory ProfessionRecipe.fromDto(ProfessionRecipeDto dto) {
    return ProfessionRecipe(
      id: dto.id,
      name: dto.name,
      expEarn: dto.expEarn,
      actvityPoints: dto.actvityPoints,
      materials:
          dto.materials.map((e) => GenericRecipeItem.fromDto(e)).toList(),
      ingredients:
          dto.ingredients.map((e) => GenericRecipeItem.fromDto(e)).toList(),
      result: GenericRecipeItem.fromDto(dto.result),
    );
  }
}
