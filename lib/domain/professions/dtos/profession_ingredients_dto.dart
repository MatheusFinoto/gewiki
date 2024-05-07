

import 'package:gw_wiki/core/constans/mapping_db.dart';

class ProfessionIngredientDto{
  final int id;
  final String professionId;
  final String name;
  final double price;

  ProfessionIngredientDto.fromJson(json):
    id = json[TbProfessionsIngredientsConstants.id],
    professionId = json[TbProfessionsIngredientsConstants.professionId],
    name = json[TbProfessionsIngredientsConstants.name],
    price = json[TbProfessionsIngredientsConstants.price];
}