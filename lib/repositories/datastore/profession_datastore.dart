import 'package:dartz/dartz.dart';
import 'package:gw_wiki/domain/objects/custom_exception.dart';
import 'package:gw_wiki/domain/professions/dtos/profession_category_dto.dart';
import 'package:gw_wiki/domain/professions/dtos/profession_dto.dart';
import 'package:gw_wiki/domain/professions/dtos/profession_ingredients_dto.dart';
import 'package:gw_wiki/domain/professions/dtos/profession_material_dto.dart';
import 'package:gw_wiki/domain/professions/entities/profession.dart';
import 'package:gw_wiki/domain/professions/entities/profession_ingredients_filter.dart';
import 'package:gw_wiki/repositories/datastore.dart';

import '../db.dart';

ProfessionsDatastore newProfessionsDatastore() => _ProfessionsDatastore();

class _ProfessionsDatastore implements ProfessionsDatastore {
  @override
  Future<Either<CustomException, List<ProfessionDto>>> getProfessions() async {
    Map data = DB.professions;

    List<ProfessionDto> professions = [];

    for (var key in data['professions']) {
      professions.add(ProfessionDto.fromJson(key));
    }

    return Right(professions);
  }

  @override
  Future<Either<CustomException, List<ProfessionIngredientDto>>>
      getProfessionIngredients(
          {required ProfessionIngredientsFilter filter}) async {
    Map data = DB.professionsIngredients;

    List<ProfessionIngredientDto> professionsIngredients = [];

    for (var key in data['ingredients']) {
      professionsIngredients.add(ProfessionIngredientDto.fromJson(key));
    }

    return Right(professionsIngredients
        .where((element) => element.professionId == filter.professionId)
        .toList());
  }

  @override
  Future<Either<CustomException, List<ProfessionMaterialDto>>> getProfessionsMaterials()async {
    Map data = DB.professionsMaterials;

    List<ProfessionMaterialDto> professionsMaterials = [];

    for (var key in data['materials']) {
      professionsMaterials.add(ProfessionMaterialDto.fromJson(key));
    }

    return Right(professionsMaterials);
  }

  @override
  Future<Either<CustomException, List<ProfessionCategoryDto>>> getProfessionCategory({required Profession profession})async {
    Map data = DB.professionsCategory;

    List<ProfessionCategoryDto> professionsCategory = [];

    for (var key in data[profession.id.toString()]['category']) {
      professionsCategory.add(ProfessionCategoryDto.fromJson(key));
    }

    return Right(professionsCategory);
  }
  
  @override
  Future<Either<CustomException, List<ProfessionMaterialDto>>> getProfessionsResultMaterials({required Profession profession})async {
    Map data = DB.professionsMaterials;

    List<ProfessionMaterialDto> professionsMaterials = [];

     for (var key in data[profession.id.toString()]['materials']) {
      professionsMaterials.add(ProfessionMaterialDto.fromJson(key));
    }

    return Right(professionsMaterials);
  }
}
