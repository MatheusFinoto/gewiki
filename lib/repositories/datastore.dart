import 'package:dartz/dartz.dart';

import '../domain/objects/custom_exception.dart';
import '../domain/professions/dtos/profession_category_dto.dart';
import '../domain/professions/dtos/profession_dto.dart';
import '../domain/professions/dtos/profession_ingredients_dto.dart';
import '../domain/professions/dtos/profession_material_dto.dart';
import '../domain/professions/entities/profession.dart';
import '../domain/professions/entities/profession_ingredients_filter.dart';

abstract class ProfessionsDatastore {
  Future<Either<CustomException, List<ProfessionDto>>> getProfessions();
  Future<Either<CustomException, List<ProfessionIngredientDto>>>getProfessionIngredients({required ProfessionIngredientsFilter filter});
  Future<Either<CustomException, List<ProfessionMaterialDto>>> getProfessionsMaterials();
  Future<Either<CustomException, List<ProfessionCategoryDto>>> getProfessionCategory({required Profession profession});
  Future<Either<CustomException, List<ProfessionMaterialDto>>> getProfessionsResultMaterials({required Profession profession});
}
