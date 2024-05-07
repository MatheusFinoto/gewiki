

import '../../../core/constans/mapping_db.dart';
import '../../objects/dtos/generic_recipe_item_dto.dart';

class ProfessionRecipeDto{
  final int id;
  final String name;
  final int expEarn;
  final int actvityPoints;
  final List<GenericRecipeItemDto> materials;
  final List<GenericRecipeItemDto> ingredients;
  final GenericRecipeItemDto result;

  ProfessionRecipeDto.fromJson(json):
    id = json[TbProfessionRecipeConstants.id],
    name = json[TbProfessionRecipeConstants.name],
    expEarn = json[TbProfessionRecipeConstants.expEarn],
    actvityPoints = json[TbProfessionRecipeConstants.actvityPoints],
    materials = (json[TbProfessionRecipeConstants.materials] as List).map((e) => GenericRecipeItemDto.fromJson(e)).toList(),
    ingredients = (json[TbProfessionRecipeConstants.ingredients] as List).map((e) => GenericRecipeItemDto.fromJson(e)).toList(),
    result = GenericRecipeItemDto.fromJson(json[TbProfessionRecipeConstants.result]);
}