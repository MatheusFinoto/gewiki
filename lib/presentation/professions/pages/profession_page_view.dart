import 'package:flutter/material.dart';
import 'package:gw_wiki/domain/professions/entities/profession.dart';
import 'package:provider/provider.dart';

import '../components/recipe_result_headline.dart';
import '../states/profession_page_state.dart';

class ProfessionPageView extends StatelessWidget {
  final Profession profession;
  const ProfessionPageView({super.key, required this.profession});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
        create: (_) => ProfessionPageState(context, profession),
        child: Consumer<ProfessionPageState>(builder: (_, state, __) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                      itemCount: state.professionCategories.length,
                      itemBuilder: (_, i) {
                        final recipe = state.professionCategories[i];
                        return Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            title: Text(recipe.name),
                            children: recipe.recipes
                                .map((recipe) => Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: ListTile(
                                        title: Text(recipe.name,
                                            style: textTheme.titleMedium!
                                                .copyWith(
                                                    color:
                                                        state.selectedRecipe ==
                                                                recipe
                                                            ? Colors.blue
                                                            : Colors.black)),
                                        onTap: () => state.selectRecipe(recipe),
                                      ),
                                    ))
                                .toList(),
                          ),
                        );
                      })),
              Expanded(
                flex: 3,
                child: state.selectedRecipe != null
                    ? Column(
                        children: [
                          const SizedBox(height: 16),
                          RecipeResultHeadline(
                            selectedRecipe: state.selectedRecipe!,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('Materials',
                                        style: textTheme.titleMedium),
                                    const SizedBox(height: 16),
                                    ...state.selectedRecipe!.materials
                                        .map((material) => ListTile(
                                              title: Text(
                                                  '${material.quantity}x ${state.listMaterials.firstWhere((element) => element.id == material.id).name}'),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text('Ingredients',
                                        style: textTheme.titleMedium),
                                    const SizedBox(height: 16),
                                    ...state.selectedRecipe!.ingredients
                                        .map((ingredient) => ListTile(
                                              title: Text(
                                                  '${ingredient.quantity}x ${state.listIngredients.firstWhere((element) => element.id == ingredient.id).name}'),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
              ),
            ],
          );
        }));
  }
}
