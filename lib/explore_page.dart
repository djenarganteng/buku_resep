import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'recipe_data.dart';
import 'recipe_detail_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
    this.initialQuery = '',
    this.initialCategory = 'Semua',
  });

  final String initialQuery;
  final String initialCategory;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late final TextEditingController _searchController;
  late String _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
    _searchController = TextEditingController(text: widget.initialQuery)
      ..addListener(_handleSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_handleSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _handleSearchChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<Recipe> visibleRecipes = searchRecipes(
      _searchController.text,
      category: _selectedCategory,
    );

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Text(
              'Jelajah',
              style: theme.textTheme.displaySmall?.copyWith(
                color: AppColors.primaryDeep,
                fontFamily: 'serif',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Cari inspirasi resep dari berbagai daerah, momen makan, dan mood dapur hari ini.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Cari resep, bahan, atau daerah asal...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchController.text.isEmpty
                    ? Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withOpacity(0.18),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.tune_rounded,
                          color: AppColors.primaryDeep,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          _searchController.clear();
                        },
                        icon: const Icon(Icons.close_rounded),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recipeCategories.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 10),
                itemBuilder: (BuildContext context, int index) {
                  final String category = recipeCategories[index];
                  final bool selected = _selectedCategory == category;

                  return ChoiceChip(
                    label: Text(category),
                    selected: selected,
                    onSelected: (_) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            if (visibleRecipes.isEmpty)
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.outline),
                ),
                child: Column(
                  children: <Widget>[
                    const Icon(
                      Icons.search_off_rounded,
                      size: 40,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Resep tidak ditemukan',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Coba cari nama makanan, daerah, atau bahan lain seperti ayam, santan, atau jahe.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              )
            else
              ...visibleRecipes.map(
                (Recipe recipe) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _ExploreRecipeCard(
                    recipe: recipe,
                    searchQuery: _searchController.text,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ExploreRecipeCard extends StatelessWidget {
  const _ExploreRecipeCard({
    required this.recipe,
    required this.searchQuery,
  });

  final Recipe recipe;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String matchedIngredient = _matchedIngredient(recipe, searchQuery);

    return InkWell(
      borderRadius: BorderRadius.circular(26),
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
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: AppColors.outline),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.textPrimary.withOpacity(0.05),
              blurRadius: 24,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                recipe.image,
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: recipe.tags.take(3).map((String tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    tag,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: AppColors.primaryDeep,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            _HighlightedText(
              text: recipe.title,
              query: searchQuery,
              style: theme.textTheme.headlineSmall?.copyWith(
                    fontFamily: 'serif',
                  ),
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  ..._highlightedSpans(
                    text: recipe.region,
                    query: searchQuery,
                    baseStyle: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: ' - ',
                    style: theme.textTheme.bodyMedium,
                  ),
                  ..._highlightedSpans(
                    text: recipe.description,
                    query: searchQuery,
                    baseStyle: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            if (matchedIngredient.isNotEmpty) ...<Widget>[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Bahan cocok: ',
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.primaryDeep,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            ..._highlightedSpans(
                              text: matchedIngredient,
                              query: searchQuery,
                              baseStyle: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 14),
            Row(
              children: <Widget>[
                _InfoPill(
                  icon: Icons.schedule_rounded,
                  label: recipe.time,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                _InfoPill(
                  icon: Icons.star_rounded,
                  label: recipe.rating,
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 8),
                _InfoPill(
                  icon: Icons.local_fire_department_outlined,
                  label: recipe.difficulty,
                  color: AppColors.tertiary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String _matchedIngredient(Recipe recipe, String query) {
  final String normalizedQuery = query.trim().toLowerCase();
  if (normalizedQuery.isEmpty) {
    return '';
  }

  for (final String ingredient in recipe.ingredients) {
    if (ingredient.toLowerCase().contains(normalizedQuery)) {
      return ingredient;
    }
  }

  return '';
}

List<TextSpan> _highlightedSpans({
  required String text,
  required String query,
  required TextStyle? baseStyle,
}) {
  final String normalizedQuery = query.trim().toLowerCase();
  if (normalizedQuery.isEmpty) {
    return <TextSpan>[TextSpan(text: text, style: baseStyle)];
  }

  final String lowerText = text.toLowerCase();
  final List<TextSpan> spans = <TextSpan>[];
  int start = 0;

  while (true) {
    final int matchIndex = lowerText.indexOf(normalizedQuery, start);
    if (matchIndex < 0) {
      if (start < text.length) {
        spans.add(TextSpan(text: text.substring(start), style: baseStyle));
      }
      break;
    }

    if (matchIndex > start) {
      spans.add(
        TextSpan(
          text: text.substring(start, matchIndex),
          style: baseStyle,
        ),
      );
    }

    spans.add(
      TextSpan(
        text: text.substring(matchIndex, matchIndex + normalizedQuery.length),
        style: (baseStyle ?? const TextStyle()).copyWith(
          color: AppColors.primaryDeep,
          fontWeight: FontWeight.w800,
          backgroundColor: AppColors.secondary.withOpacity(0.22),
        ),
      ),
    );

    start = matchIndex + normalizedQuery.length;
  }

  return spans;
}

class _HighlightedText extends StatelessWidget {
  const _HighlightedText({
    required this.text,
    required this.query,
    required this.style,
  });

  final String text;
  final String query;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _highlightedSpans(
          text: text,
          query: query,
          baseStyle: style,
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
