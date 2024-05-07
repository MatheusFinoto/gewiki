import 'package:gw_wiki/repositories/maps/itens/mapping_professions_recipe.dart';

import 'maps/itens/mapping_professions_materials.dart';
import 'maps/itens/mapping_profession_ingredients.dart';

class DB {
  static const Map<String, dynamic> professions = {
    'professions': [
      {
        'id': '1',
        'name': 'Alchemy',
      },
      {
        'id': '2',
        'name': 'Blacksmith',
      },
      {
        'id': '3',
        'name': 'Mythcraft',
      },
      {
        'id': '4',
        'name': 'Scholar',
      },
    ]
  };

  static const Map<String, dynamic> professionsIngredients = mappingProfessionsIngredients;

  static const Map<String, dynamic> professionsMaterials = mappingProfessionsMaterials;
  
  static const Map<String, dynamic> professionsResultMaterials = mappingProfessionsResultMaterial;
  
  static const Map<String, dynamic> professionsCategory = mappingProfessionsCategory;
}
