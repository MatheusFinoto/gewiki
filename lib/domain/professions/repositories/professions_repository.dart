import 'package:dartz/dartz.dart';
import 'package:gw_wiki/domain/professions/entities/profession_category.dart';
import 'package:gw_wiki/domain/professions/entities/profession_ingredients.dart';
import 'package:gw_wiki/domain/professions/entities/profession_material.dart';

import '../../objects/custom_exception.dart';
import '../entities/profession.dart';
import '../entities/profession_ingredients_filter.dart';

abstract class ProfessionsUsecase {
  Future<Either<CustomException, List<Profession>>> getProfessions();
  Future<Either<CustomException, List<ProfessionIngredient>>> getProfessionIngredients({required ProfessionIngredientsFilter filter});
  Future<Either<CustomException, List<ProfessionMaterial>>> getProfessionsMaterials();
  Future<Either<CustomException, List<ProfessionCategory>>> getProfessionCategory({required Profession profession});
  Future<Either<CustomException, List<ProfessionMaterial>>> getProfessionsResultMaterials({required Profession profession});
}
