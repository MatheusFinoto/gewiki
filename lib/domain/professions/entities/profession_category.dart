// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../dtos/profession_category_dto.dart';
import 'profession_recipe.dart';

class ProfessionCategory {
  final String name;
  final List<ProfessionRecipe> recipes;
  ProfessionCategory({
    required this.name,
    required this.recipes,
  });

  ProfessionCategory copyWith({
    String? name,
    List<ProfessionRecipe>? recipes,
  }) {
    return ProfessionCategory(
      name: name ?? this.name,
      recipes: recipes ?? this.recipes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'recipes': recipes.map((x) => x.toMap()).toList(),
    };
  }

  factory ProfessionCategory.fromMap(Map<String, dynamic> map) {
    return ProfessionCategory(
      name: map['name'] as String,
      recipes: List<ProfessionRecipe>.from(
        (map['recipes'] as List<int>).map<ProfessionRecipe>(
          (x) => ProfessionRecipe.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfessionCategory.fromJson(String source) =>
      ProfessionCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfessionCategory(name: $name, recipes: $recipes)';

  @override
  bool operator ==(covariant ProfessionCategory other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.recipes, recipes);
  }

  @override
  int get hashCode => name.hashCode ^ recipes.hashCode;

  factory ProfessionCategory.fromDto(ProfessionCategoryDto dto) {
    return ProfessionCategory(
      name: dto.name,
      recipes: dto.recipes.map((e) => ProfessionRecipe.fromDto(e)).toList(),
    );
  }
}
