

import 'package:gw_wiki/core/constans/mapping_db.dart';

class GenericRecipeItemDto {
  final int id;
  final int quantity;

  GenericRecipeItemDto.fromJson(json):
    id = json[TbGenericRecipeItenConstants.id],
    quantity = json[TbGenericRecipeItenConstants.quantity];
}