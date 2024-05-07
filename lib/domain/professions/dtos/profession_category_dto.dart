

import 'package:gw_wiki/core/constans/mapping_db.dart';

import 'profession_recipe_dto.dart';

class ProfessionCategoryDto{
  final String name;
  final List<ProfessionRecipeDto> recipes;

  ProfessionCategoryDto.fromJson(json):
    name = json[TbProfessionCategoryConstants.name],
    recipes = (json[TbProfessionCategoryConstants.recipes] as List).map((e) => ProfessionRecipeDto.fromJson(e)).toList();
}