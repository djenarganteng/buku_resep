import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'bookmark_store.dart';
import 'profile_settings_page.dart';
import 'recipe_data.dart';
import 'recipe_detail_page.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<Set<String>>(
          valueListenable: savedRecipeKeys,
          builder: (
            BuildContext context,
            Set<String> savedKeys,
            Widget? child,
          ) {
            final List<Recipe> savedRecipes = bookmarkedRecipes;
            final int savedCategories =
                savedRecipes.map((Recipe recipe) => recipe.category).toSet().length;
            final int savedRegions =
                savedRecipes.map((Recipe recipe) => recipe.region).toSet().length;

            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Koleksiku',
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: AppColors.primaryDeep,
                              fontFamily: 'serif',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Resep yang kamu simpan agar mudah dibuka lagi saat ingin memasak dengan tenang.',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ProfileSettingsPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.person_outline_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColors.outline),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _CollectionStat(
                          label: 'Disimpan',
                          value: '${savedRecipes.length}',
                        ),
                      ),
                      Expanded(
                        child: _CollectionStat(
                          label: 'Kategori',
                          value: '$savedCategories',
                        ),
                      ),
                      Expanded(
                        child: _CollectionStat(
                          label: 'Daerah',
                          value: '$savedRegions',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                if (savedRecipes.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: AppColors.outline),
                    ),
                    child: Column(
                      children: <Widget>[
                        const Icon(
                          Icons.bookmark_border_rounded,
                          size: 42,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Belum ada resep tersimpan',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Buka resep mana saja lalu tekan bookmark agar resep itu muncul di halaman koleksi.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ...savedRecipes.map(
                    (Recipe recipe) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _SavedRecipeTile(recipe: recipe),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CollectionStat extends StatelessWidget {
  const _CollectionStat({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontFamily: 'serif',
            color: AppColors.primaryDeep,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _SavedRecipeTile extends StatelessWidget {
  const _SavedRecipeTile({required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => RecipeDetailPage(recipe: recipe),
          ),
        );
      },
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.outline),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                recipe.image,
                width: 92,
                height: 104,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    recipe.title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontFamily: 'serif',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    recipe.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.bookmark_rounded,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Disimpan',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.primaryDeep,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_rounded,
              color: AppColors.primaryDeep,
            ),
          ],
        ),
      ),
    );
  }
}
