import 'package:flutter/material.dart';

import '../../../domain/professions/entities/profession_recipe.dart';

class RecipeResultHeadline extends StatelessWidget {
  final ProfessionRecipe selectedRecipe;
  const RecipeResultHeadline({super.key, required this.selectedRecipe});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${selectedRecipe.name} * ${selectedRecipe.result.quantity}',
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Ap Consume: ${selectedRecipe.actvityPoints}'),
                ],
              ),
              Row(
                children: [
                  Text('Earn Exp: ${selectedRecipe.expEarn}'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
