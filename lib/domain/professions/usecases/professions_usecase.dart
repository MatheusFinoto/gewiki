import 'package:dartz/dartz.dart';
import 'package:gw_wiki/domain/objects/custom_exception.dart';
import 'package:gw_wiki/domain/professions/entities/profession.dart';
import 'package:gw_wiki/domain/professions/entities/profession_category.dart';
import 'package:gw_wiki/domain/professions/entities/profession_ingredients.dart';
import 'package:gw_wiki/domain/professions/entities/profession_ingredients_filter.dart';
import 'package:gw_wiki/domain/professions/entities/profession_material.dart';
import 'package:gw_wiki/domain/professions/repositories/professions_repository.dart';
import 'package:gw_wiki/repositories/datastore.dart';

ProfessionsUsecase newProfessionsUsecase(ProfessionsDatastore datastore) =>
    _ProfessionsUsecase(datastore);

class _ProfessionsUsecase implements ProfessionsUsecase {
  final ProfessionsDatastore datastore;
  _ProfessionsUsecase(this.datastore);

  @override
  Future<Either<CustomException, List<Profession>>> getProfessions() async {
    return datastore.getProfessions().then((value) =>
        value.map((e) => e.map((e) => Profession.fromDto(e)).toList()));
  }

  @override
  Future<Either<CustomException, List<ProfessionIngredient>>>
      getProfessionIngredients({required ProfessionIngredientsFilter filter})async {
    return datastore
        .getProfessionIngredients(filter: filter)
        .then((value) =>
            value.map((e) => e.map((e) => ProfessionIngredient.fromDto(e)).toList()));
  }

  @override
  Future<Either<CustomException, List<ProfessionMaterial>>> getProfessionsMaterials()async {
    return datastore.getProfessionsMaterials().then((value) =>
        value.map((e) => e.map((e) => ProfessionMaterial.fromDto(e)).toList()));
  }

  @override
  Future<Either<CustomException, List<ProfessionCategory>>> getProfessionCategory({required Profession profession}) {
    return datastore.getProfessionCategory(profession: profession).then((value) =>
        value.map((e) => e.map((e) => ProfessionCategory.fromDto(e)).toList()));
  }
  
  @override
  Future<Either<CustomException, List<ProfessionMaterial>>> getProfessionsResultMaterials({required Profession profession}) {
    return datastore.getProfessionsResultMaterials(profession: profession).then((value) =>
        value.map((e) => e.map((e) => ProfessionMaterial.fromDto(e)).toList()));
  }
}
