import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';
import 'category_page.dart';

final List<Map<String, dynamic>> recipeList = [
  {
    'title': 'Nasi Goreng Spesial',
    'time': '30 Menit',
    'rating': '4.8',
    'image': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=800&q=80',
    'ingredients': [
      '1 piring Nasi putih',
      '2 butir Telur ayam',
      '3 siung Bawang merah',
      '2 siung Bawang putih',
      'Kecap manis & garam secukupnya',
    ],
    'steps': [
      'Haluskan bawang merah dan bawang putih.',
      'Panaskan minyak, tumis bumbu halus hingga harum.',
      'Masukkan telur, orak-arik hingga matang.',
      'Masukkan nasi putih, aduk hingga rata dengan bumbu.',
      'Tambahkan kecap manis dan garam, aduk kembali.',
      'Sajikan selagi hangat.',
    ],
  },
  {
    'title': 'Ayam Bakar Madu',
    'time': '45 Menit',
    'rating': '4.9',
    'image': 'https://images.unsplash.com/photo-1598514982205-f36b96d1e8d4?auto=format&fit=crop&w=800&q=80',
    'ingredients': [
      '500gr Daging ayam',
      '3 sdm Madu',
      '2 sdm Kecap manis',
      '1 sdm Air asam jawa',
      'Garam dan lada secukupnya',
    ],
    'steps': [
      'Cuci bersih ayam, lumuri dengan garam dan lada.',
      'Campurkan madu, kecap manis, dan air asam jawa.',
      'Oleskan campuran madu ke seluruh bagian ayam.',
      'Diamkan selama 15 menit agar bumbu meresap.',
      'Bakar ayam di atas teflon atau arang hingga matang kecoklatan.',
      'Sajikan dengan sambal dan lalapan.',
    ],
  },
  {
    'title': 'Sayur Sop Bening',
    'time': '20 Menit',
    'rating': '4.5',
    'image': 'https://images.unsplash.com/photo-1584003397078-45ef96d6174d?q=80&w=688&auto=format&fit=crop',
    'ingredients': [
      '2 buah Wortel (potong dadu)',
      '1 buah Kentang (potong dadu)',
      '1/4 bonggol Kol',
      '2 siung Bawang putih (geprek)',
      'Kaldu ayam secukupnya',
    ],
    'steps': [
      'Didihkan air di dalam panci.',
      'Masukkan bawang putih geprek, wortel, dan kentang.',
      'Masak hingga sayuran agak empuk.',
      'Tambahkan kol dan kaldu ayam, aduk rata.',
      'Masak sebentar hingga kol layu. Angkat dan sajikan.',
    ],
  },
  {
    'title': 'Mie Goreng Tek-Tek',
    'time': '15 Menit',
    'rating': '4.7',
    'image': 'https://images.unsplash.com/photo-1634864572865-1cf8ff8bd23d?w=600&auto=format&fit=crop',
    'ingredients': [
      '1 bungkus Mie (rebus dan tiriskan)',
      '1 butir Telur',
      'Sawi hijau secukupnya',
      '3 siung Bawang merah & 2 siung Bawang putih (haluskan)',
      'Kecap manis, saus sambal, garam',
    ],
    'steps': [
      'Tumis bumbu halus hingga harum.',
      'Sisihkan bumbu di pinggir wajan, masukkan telur lalu orak-arik.',
      'Masukkan sayur sawi, tumis hingga layu.',
      'Masukkan mie rebus, kecap, saus, dan garam. Aduk cepat.',
      'Masak hingga semua bumbu tercampur rata. Sajikan.',
    ],
  },
  {
    'title': 'Es Teh Leci',
    'time': '5 Menit',
    'rating': '4.6',
    'image': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=800&q=80',
    'ingredients': [
      '1 kantong Teh celup',
      '2 sdm Gula pasir',
      '4 buah Buah leci kalengan',
      'Air panas dan es batu secukupnya',
    ],
    'steps': [
      'Seduh teh celup dengan sedikit air panas, tambahkan gula, aduk larut.',
      'Siapkan gelas, masukkan buah leci dan es batu.',
      'Tuangkan seduhan teh ke dalam gelas.',
      'Tambahkan air dingin secukupnya. Aduk dan nikmati.',
    ],
  },
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ResepKu',
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 1.2, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            
            // --- BAGIAN SLIDER MENU HARI INI ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Menu Hari Ini',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const _FeaturedSlider(),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kategori Populer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryItem(title: 'Sarapan', icon: Icons.wb_sunny_outlined),
                      CategoryItem(title: 'Siang', icon: Icons.lunch_dining),
                      CategoryItem(title: 'Malam', icon: Icons.dark_mode_outlined),
                      CategoryItem(title: 'Minuman', icon: Icons.local_drink),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Resep Terbaru',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeList.length,
                    itemBuilder: (context, index) {
                      return _RecipeCard(recipe: recipeList[index]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// WIDGET SLIDER MENU HARI INI (VERSI BERSIH)
// =======================================================
class _FeaturedSlider extends StatelessWidget {
  const _FeaturedSlider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240, 
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: recipeList.length,
        itemBuilder: (context, index) {
          final recipe = recipeList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailPage(recipe: recipe),
                ),
              );
            },
            child: Container(
              width: 220,
              margin: const EdgeInsets.only(right: 15, bottom: 10, top: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Gambar Makanan
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          recipe['image'],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.orange.shade100,
                            child: const Icon(Icons.fastfood, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // 2. Judul Makanan
                    Text(
                      recipe['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    
                    // 3. Rating & Waktu
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          recipe['rating'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.access_time, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          recipe['time'],
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // <--- Tambahkan GestureDetector disini
      onTap: () {
        // Navigasi ke CategoryPage sambil mengirimkan nama kategorinya
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(categoryName: title),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.orange, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const _RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailPage(recipe: recipe),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  recipe['image'],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.orange.shade100,
                    child: const Icon(Icons.fastfood, color: Colors.orange),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Waktu masak: ${recipe['time']}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        Text(
                          ' ${recipe['rating']}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}