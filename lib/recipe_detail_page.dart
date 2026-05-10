import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'bookmark_store.dart';
import 'recipe_data.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  Future<void> _toggleBookmark(BuildContext context, bool isSaved) async {
    await toggleRecipeBookmark(recipe);
    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            isSaved
                ? '${recipe.title} dihapus dari koleksi.'
                : '${recipe.title} disimpan ke koleksi.',
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Resep',
          style: theme.textTheme.titleLarge?.copyWith(fontFamily: 'serif'),
        ),
        actions: <Widget>[
          ValueListenableBuilder<Set<String>>(
            valueListenable: savedRecipeKeys,
            builder: (
              BuildContext context,
              Set<String> savedKeys,
              Widget? child,
            ) {
              final bool isSaved = isRecipeSaved(recipe);
              return IconButton(
                onPressed: () => _toggleBookmark(context, isSaved),
                icon: Icon(
                  isSaved
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: isSaved ? AppColors.primary : AppColors.primaryDeep,
                ),
              );
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  recipe.image,
                  width: double.infinity,
                  height: 360,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: double.infinity,
                    height: 360,
                    color: AppColors.surfaceStrong,
                    child: const Icon(
                      Icons.broken_image_outlined,
                      size: 50,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.12),
                          Colors.black.withOpacity(0.58),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: 28,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.16),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          'RESEP PILIHAN HARI INI',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        recipe.title,
                        style: theme.textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontFamily: 'serif',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _DetailChip(
                            icon: Icons.schedule_rounded,
                            label: recipe.time,
                            background: Colors.white.withOpacity(0.18),
                          ),
                          _DetailChip(
                            icon: Icons.star_rounded,
                            label: recipe.rating,
                            background: AppColors.secondary.withOpacity(0.94),
                            foreground: AppColors.primaryDeep,
                          ),
                          _DetailChip(
                            icon: Icons.location_on_outlined,
                            label: recipe.region,
                            background: Colors.white.withOpacity(0.18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -26),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 26),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Catatan Dapur',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      recipe.description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(color: AppColors.outline),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bahan-bahan',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontFamily: 'serif',
                            ),
                          ),
                          const SizedBox(height: 14),
                          ...List.generate(
                            recipe.ingredients.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 22,
                                    height: 22,
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: BoxDecoration(
                                      color: AppColors.tertiary.withOpacity(0.14),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      size: 14,
                                      color: AppColors.tertiary,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      recipe.ingredients[index],
                                      style: theme.textTheme.bodyLarge?.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Langkah-langkah',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontFamily: 'serif',
                            ),
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(
                            recipe.steps.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 34,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? AppColors.primary
                                          : AppColors.secondary,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: theme.textTheme.labelLarge?.copyWith(
                                          color: index.isEven
                                              ? Colors.white
                                              : AppColors.primaryDeep,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      recipe.steps[index],
                                      style: theme.textTheme.bodyLarge?.copyWith(
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ValueListenableBuilder<Set<String>>(
                      valueListenable: savedRecipeKeys,
                      builder: (
                        BuildContext context,
                        Set<String> savedKeys,
                        Widget? child,
                      ) {
                        final bool isSaved = isRecipeSaved(recipe);
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _toggleBookmark(context, isSaved),
                            icon: Icon(
                              isSaved
                                  ? Icons.bookmark_remove_rounded
                                  : Icons.bookmark_add_outlined,
                            ),
                            label: Text(
                              isSaved ? 'Hapus dari Koleksi' : 'Simpan Resep',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color background;
  final Color foreground;

  const _DetailChip({
    required this.icon,
    required this.label,
    required this.background,
    this.foreground = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: foreground),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: foreground,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
