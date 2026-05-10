import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'recipe_data.dart';
import 'region_recipes_page.dart';

class AllRegionsPage extends StatefulWidget {
  const AllRegionsPage({super.key});

  @override
  State<AllRegionsPage> createState() => _AllRegionsPageState();
}

class _AllRegionsPageState extends State<AllRegionsPage> {
  final TextEditingController _regionSearchController = TextEditingController();
  String _selectedIsland = 'Semua';

  @override
  void initState() {
    super.initState();
    _regionSearchController.addListener(_handleSearchChanged);
  }

  @override
  void dispose() {
    _regionSearchController
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
    final String query = _regionSearchController.text.trim().toLowerCase();
    final List<RegionSpot> visibleRegions = regionSpots.where((RegionSpot region) {
      final bool islandMatches = _selectedIsland == 'Semua' ||
          islandForRegion(region.name) == _selectedIsland;
      final bool queryMatches =
          query.isEmpty || region.name.toLowerCase().contains(query);
      return islandMatches && queryMatches;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Semua Daerah',
          style: theme.textTheme.titleLarge?.copyWith(fontFamily: 'serif'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Text(
            'Jelajah Rasa Indonesia',
            style: theme.textTheme.displaySmall?.copyWith(
              color: AppColors.primaryDeep,
              fontFamily: 'serif',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Cari daerah, pilih pulau, lalu buka kumpulan resep khas dari setiap wilayah Indonesia.',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _regionSearchController,
            decoration: InputDecoration(
              hintText: 'Cari nama daerah...',
              prefixIcon: const Icon(Icons.location_on_outlined),
              suffixIcon: _regionSearchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        _regionSearchController.clear();
                      },
                      icon: const Icon(Icons.close_rounded),
                    ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: islandFilters.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 10),
              itemBuilder: (BuildContext context, int index) {
                final String island = islandFilters[index];
                return ChoiceChip(
                  label: Text(island),
                  selected: island == _selectedIsland,
                  onSelected: (_) {
                    setState(() {
                      _selectedIsland = island;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.outline),
            ),
            child: Row(
              children: <Widget>[
                const Icon(Icons.travel_explore_rounded, color: AppColors.primary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${visibleRegions.length} daerah siap dijelajahi',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          if (visibleRegions.isEmpty)
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
                    'Daerah tidak ditemukan',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Coba kata kunci lain atau ubah filter pulau supaya hasilnya muncul lagi.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 18,
                crossAxisSpacing: 12,
                mainAxisExtent: 120,
              ),
              itemCount: visibleRegions.length,
              itemBuilder: (BuildContext context, int index) {
                return _RegionCircleItem(region: visibleRegions[index]);
              },
            ),
        ],
      ),
    );
  }
}

class _RegionCircleItem extends StatelessWidget {
  const _RegionCircleItem({required this.region});

  final RegionSpot region;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => RegionRecipesPage(region: region),
          ),
        );
      },
      child: SizedBox(
        width: 88,
        child: Column(
          children: <Widget>[
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outline, width: 2),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: AppColors.textPrimary.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.network(
                  region.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              region.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
