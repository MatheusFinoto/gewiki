import '../alchemy/mapping_alchemy_material.dart';
import '../alchemy/mapping_alchemy_recipes.dart';
import '../blacksmith/mapping_blacksmith_recipes.dart';
import '../mythcraft/mapping_mythcraft_recipes.dart';
import '../sholar/mapping_scholar_recipes.dart';

const Map<String, dynamic> mappingProfessionsCategory = {
  "1": mappingProfessionsRecipesAlchemy,
  "2": mappingProfessionsRecipesBlacksmith,
  "3": mappingProfessionsRecipesMythcraft,
  "4": mappingProfessionsRecipesSchollar,
};


//! materiais que vao ser criados a partir das receitas
const Map<String, dynamic> mappingProfessionsResultMaterial = {
  "1": mappingAlchemyResultMaterial,
  "2": mappingProfessionsRecipesBlacksmith,
  "3": mappingProfessionsRecipesMythcraft,
  "4": mappingProfessionsRecipesSchollar,
};