import 'package:flutter/material.dart';
import 'package:gw_wiki/domain/professions/entities/profession.dart';
import 'package:gw_wiki/domain/professions/entities/profession_ingredients_filter.dart';
import 'package:gw_wiki/domain/professions/entities/profession_recipe.dart';
import 'package:provider/provider.dart';

import '../../../domain/professions/entities/profession_category.dart';
import '../../../domain/professions/entities/profession_ingredients.dart';
import '../../../domain/professions/entities/profession_material.dart';
import '../../../domain/professions/repositories/professions_repository.dart';

class ProfessionPageState extends ChangeNotifier {
  final BuildContext context;
  final Profession profession;

  ProfessionPageState(this.context, this.profession) {
    _init();
  }

  bool loading = false;

  void _init() async {
    getIngredients();
    getMaterials();
    getResultMaterials();
    getProfessionRecipes();
  }

  List<ProfessionCategory> professionCategories = [];

  void getProfessionRecipes() async {
    loading = true;
    notifyListeners();
    final result = await context
        .read<ProfessionsUsecase>()
        .getProfessionCategory(profession: profession);
    result.fold((l) {}, (r) {
      professionCategories = r;
    });

    loading = false;
    notifyListeners();
  }

  ProfessionRecipe? selectedRecipe;

  void selectRecipe(ProfessionRecipe recipe) {
    selectedRecipe = recipe;
    notifyListeners();
  }

  List<ProfessionIngredient> listIngredients = [];

  void getIngredients() async {
    final result = await context
        .read<ProfessionsUsecase>()
        .getProfessionIngredients(
            filter: ProfessionIngredientsFilter(professionId: profession.id));
    result.fold((l) {}, (r) {
      listIngredients = r;
    });
    notifyListeners();
  }

  List<ProfessionMaterial> listMaterials = [];

  void getMaterials() async {
    final result =
        await context.read<ProfessionsUsecase>().getProfessionsMaterials();
    result.fold((l) {}, (r) {
      listMaterials = r;
    });
    notifyListeners();
  }

  List<ProfessionMaterial> listResultMaterials = [];

  void getResultMaterials() async {
    final result = await context
        .read<ProfessionsUsecase>()
        .getProfessionsResultMaterials(profession: profession);
    result.fold((l) {}, (r) {
      listResultMaterials = r;
    });
    notifyListeners();
  }
}
