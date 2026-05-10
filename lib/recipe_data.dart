class Recipe {
  const Recipe({
    required this.title,
    required this.region,
    required this.description,
    required this.time,
    required this.rating,
    required this.difficulty,
    required this.category,
    required this.image,
    required this.tags,
    required this.ingredients,
    required this.steps,
    this.featured = false,
    this.saved = false,
  });

  final String title;
  final String region;
  final String description;
  final String time;
  final String rating;
  final String difficulty;
  final String category;
  final String image;
  final List<String> tags;
  final List<String> ingredients;
  final List<String> steps;
  final bool featured;
  final bool saved;
}

class RegionSpot {
  const RegionSpot({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;
}

class RecipeSeed {
  const RecipeSeed({
    required this.title,
    required this.category,
    this.featured = false,
    this.saved = false,
  });

  final String title;
  final String category;
  final bool featured;
  final bool saved;
}

class RegionCatalog {
  const RegionCatalog({
    required this.name,
    required this.image,
    required this.seeds,
  });

  final String name;
  final String image;
  final List<RecipeSeed> seeds;
}

const List<String> recipeCategories = <String>[
  'Semua',
  'Sarapan',
  'Siang',
  'Malam',
  'Minuman',
];

const String _breakfastImage =
    'https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?auto=format&fit=crop&w=900&q=80';
const String _lunchImage =
    'https://images.unsplash.com/photo-1598515214211-89d3c73ae83b?auto=format&fit=crop&w=900&q=80';
const String _dinnerImage =
    'https://images.unsplash.com/photo-1617093727343-374698b1b08d?auto=format&fit=crop&w=900&q=80';
const String _drinkImage =
    'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=900&q=80';
const String _soupImage =
    'https://images.unsplash.com/photo-1604909052743-94e838986d24?auto=format&fit=crop&w=900&q=80';
const String _snackImage =
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=80';
const String _vegImage =
    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=900&q=80';
const String _grillImage =
    'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?auto=format&fit=crop&w=900&q=80';

const List<RegionCatalog> _regionCatalog = <RegionCatalog>[
  RegionCatalog(
    name: 'Aceh',
    image: _breakfastImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Mie Aceh', category: 'Malam', featured: true, saved: true),
      RecipeSeed(title: 'Ayam Tangkap', category: 'Siang'),
      RecipeSeed(title: 'Kuah Beulangong', category: 'Siang'),
      RecipeSeed(title: 'Sie Reuboh', category: 'Malam'),
      RecipeSeed(title: 'Timphan', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Sumatera Utara',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Bika Ambon', category: 'Sarapan', saved: true),
      RecipeSeed(title: 'Soto Medan', category: 'Siang'),
      RecipeSeed(title: 'Arsik Ikan Mas', category: 'Siang'),
      RecipeSeed(title: 'Naniura', category: 'Malam'),
      RecipeSeed(title: 'Mie Gomak', category: 'Malam'),
    ],
  ),
  RegionCatalog(
    name: 'Sumatera Barat',
    image: _lunchImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Rendang', category: 'Siang', featured: true, saved: true),
      RecipeSeed(title: 'Sate Padang', category: 'Malam'),
      RecipeSeed(title: 'Soto Padang', category: 'Sarapan'),
      RecipeSeed(title: 'Dendeng Balado', category: 'Siang'),
      RecipeSeed(title: 'Lamang Tapai', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Riau',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Gulai Ikan Patin', category: 'Siang'),
      RecipeSeed(title: 'Mie Sagu', category: 'Malam'),
      RecipeSeed(title: 'Asam Pedas Baung', category: 'Siang'),
      RecipeSeed(title: 'Bolu Kemojo', category: 'Sarapan'),
      RecipeSeed(title: 'Roti Jala Kari', category: 'Malam'),
    ],
  ),
  RegionCatalog(
    name: 'Kepulauan Riau',
    image: _drinkImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Lakse', category: 'Sarapan'),
      RecipeSeed(title: 'Gonggong Rebus', category: 'Siang'),
      RecipeSeed(title: 'Mie Tarempa', category: 'Malam'),
      RecipeSeed(title: 'Otak-otak Kepulauan Riau', category: 'Malam'),
      RecipeSeed(title: 'Teh Obeng', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Jambi',
    image: _lunchImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Tempoyak Patin', category: 'Siang'),
      RecipeSeed(title: 'Gulai Tepek Ikan', category: 'Malam'),
      RecipeSeed(title: 'Nasi Gemuk Jambi', category: 'Sarapan'),
      RecipeSeed(title: 'Kue Padamaran', category: 'Minuman'),
      RecipeSeed(title: 'Es Kacang Merah Jambi', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Sumatera Selatan',
    image: _snackImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Pempek', category: 'Malam', featured: true, saved: true),
      RecipeSeed(title: 'Tekwan', category: 'Sarapan'),
      RecipeSeed(title: 'Model Ikan', category: 'Siang'),
      RecipeSeed(title: 'Pindang Patin', category: 'Siang'),
      RecipeSeed(title: 'Es Kacang Merah Palembang', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Bangka Belitung',
    image: _dinnerImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Mie Belitung', category: 'Sarapan'),
      RecipeSeed(title: 'Lempah Kuning', category: 'Siang'),
      RecipeSeed(title: 'Rusip', category: 'Malam'),
      RecipeSeed(title: 'Kemplang Panggang', category: 'Malam'),
      RecipeSeed(title: 'Es Jeruk Kunci', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Bengkulu',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Pendap', category: 'Siang'),
      RecipeSeed(title: 'Bagar Hiu', category: 'Malam'),
      RecipeSeed(title: 'Gulai Kembaang', category: 'Siang'),
      RecipeSeed(title: 'Tempoyak Bengkulu', category: 'Sarapan'),
      RecipeSeed(title: 'Sirup Kalamansi', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Lampung',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Seruit', category: 'Siang'),
      RecipeSeed(title: 'Gulai Taboh', category: 'Siang'),
      RecipeSeed(title: 'Sekubal', category: 'Sarapan'),
      RecipeSeed(title: 'Keripik Pisang Lampung', category: 'Minuman'),
      RecipeSeed(title: 'Mie Khodon', category: 'Malam'),
    ],
  ),
  RegionCatalog(
    name: 'Banten',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Sate Bandeng', category: 'Siang'),
      RecipeSeed(title: 'Rabeg', category: 'Malam'),
      RecipeSeed(title: 'Angeun Lada', category: 'Siang'),
      RecipeSeed(title: 'Pecak Bandeng', category: 'Malam'),
      RecipeSeed(title: 'Ketan Bintul', category: 'Sarapan'),
    ],
  ),
  RegionCatalog(
    name: 'Jakarta',
    image: _breakfastImage,
    seeds: <RecipeSeed>[
      RecipeSeed(
        title: 'Nasi Uduk Betawi',
        category: 'Sarapan',
        featured: true,
        saved: true,
      ),
      RecipeSeed(title: 'Soto Betawi', category: 'Siang', saved: true),
      RecipeSeed(title: 'Kerak Telor', category: 'Malam'),
      RecipeSeed(title: 'Ketoprak Jakarta', category: 'Siang'),
      RecipeSeed(title: 'Es Selendang Mayang', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Jawa Barat',
    image: _vegImage,
    seeds: <RecipeSeed>[
      RecipeSeed(
        title: 'Bubur Ayam Cirebon',
        category: 'Sarapan',
        saved: true,
      ),
      RecipeSeed(title: 'Nasi Timbel', category: 'Siang', featured: true),
      RecipeSeed(title: 'Karedok', category: 'Siang'),
      RecipeSeed(title: 'Batagor Bandung', category: 'Malam'),
      RecipeSeed(title: 'Es Cendol Bandung', category: 'Minuman', saved: true),
    ],
  ),
  RegionCatalog(
    name: 'Jawa Tengah',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Lumpia Semarang', category: 'Siang'),
      RecipeSeed(title: 'Soto Kudus', category: 'Sarapan'),
      RecipeSeed(title: 'Garang Asem', category: 'Siang'),
      RecipeSeed(title: 'Tahu Gimbal', category: 'Malam'),
      RecipeSeed(title: 'Wedang Ronde', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'DI Yogyakarta',
    image: _snackImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Gudeg Jogja', category: 'Siang', featured: true, saved: true),
      RecipeSeed(title: 'Bakmi Jawa', category: 'Malam', featured: true),
      RecipeSeed(title: 'Sate Klathak', category: 'Malam'),
      RecipeSeed(title: 'Oseng Mercon', category: 'Malam'),
      RecipeSeed(title: 'Kopi Joss', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Jawa Timur',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Rawon', category: 'Siang', featured: true),
      RecipeSeed(title: 'Soto Lamongan', category: 'Sarapan'),
      RecipeSeed(title: 'Rujak Cingur', category: 'Siang'),
      RecipeSeed(title: 'Pecel Madiun', category: 'Malam'),
      RecipeSeed(title: 'Wedang Angsle', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Bali',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Ayam Betutu', category: 'Siang', featured: true, saved: true),
      RecipeSeed(title: 'Sate Lilit', category: 'Malam'),
      RecipeSeed(title: 'Nasi Campur Bali', category: 'Siang'),
      RecipeSeed(title: 'Lawar Bali', category: 'Malam'),
      RecipeSeed(title: 'Es Daluman', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Nusa Tenggara Barat',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Ayam Taliwang', category: 'Siang'),
      RecipeSeed(title: 'Plecing Kangkung', category: 'Siang'),
      RecipeSeed(title: 'Sate Rembiga', category: 'Malam'),
      RecipeSeed(title: 'Beberuk Terong', category: 'Malam'),
      RecipeSeed(title: 'Es Kelapa Muda Lombok', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Nusa Tenggara Timur',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Sei Sapi', category: 'Siang'),
      RecipeSeed(title: 'Jagung Bose', category: 'Sarapan'),
      RecipeSeed(title: 'Catemak Jagung', category: 'Siang'),
      RecipeSeed(title: 'Rumpu Rampe', category: 'Malam'),
      RecipeSeed(title: 'Kopi Flores', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Kalimantan Barat',
    image: _vegImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Bubur Pedas Sambas', category: 'Sarapan'),
      RecipeSeed(title: 'Pengkang', category: 'Malam'),
      RecipeSeed(title: 'Chai Kue', category: 'Siang'),
      RecipeSeed(title: 'Sotong Pangkong', category: 'Malam'),
      RecipeSeed(title: 'Es Lidah Buaya', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Kalimantan Tengah',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Juhu Umbut Rotan', category: 'Siang'),
      RecipeSeed(title: 'Kalumpe', category: 'Siang'),
      RecipeSeed(title: 'Wadi Patin', category: 'Malam'),
      RecipeSeed(title: 'Kenta', category: 'Sarapan'),
      RecipeSeed(title: 'Gagatas', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Kalimantan Selatan',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Soto Banjar', category: 'Sarapan', saved: true),
      RecipeSeed(title: 'Ketupat Kandangan', category: 'Siang'),
      RecipeSeed(title: 'Iwak Pakasam', category: 'Malam'),
      RecipeSeed(title: 'Apam Barabai', category: 'Sarapan'),
      RecipeSeed(title: 'Es Kacang Negara', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Kalimantan Timur',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Nasi Bekepor', category: 'Siang'),
      RecipeSeed(title: 'Gence Ruan', category: 'Malam'),
      RecipeSeed(title: 'Ayam Cincane', category: 'Siang'),
      RecipeSeed(title: 'Roti Mantau', category: 'Sarapan'),
      RecipeSeed(title: 'Es Sarang Burung Samarinda', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Kalimantan Utara',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Kepiting Soka Tarakan', category: 'Siang'),
      RecipeSeed(title: 'Sate Ikan Pari', category: 'Malam'),
      RecipeSeed(title: 'Nasi Subut', category: 'Sarapan'),
      RecipeSeed(title: 'Tumis Kapah', category: 'Malam'),
      RecipeSeed(title: 'Es Kelapa Tarakan', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Sulawesi Utara',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Tinutuan', category: 'Sarapan'),
      RecipeSeed(title: 'Cakalang Fufu', category: 'Siang'),
      RecipeSeed(title: 'Ayam Woku', category: 'Siang'),
      RecipeSeed(title: 'Nasi Jaha', category: 'Malam'),
      RecipeSeed(title: 'Klappertaart', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Gorontalo',
    image: _drinkImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Binte Biluhuta', category: 'Sarapan'),
      RecipeSeed(title: 'Ilabulo', category: 'Malam'),
      RecipeSeed(title: 'Ayam Iloni', category: 'Siang'),
      RecipeSeed(title: 'Sate Tuna Gorontalo', category: 'Malam'),
      RecipeSeed(title: 'Es Pala Gorontalo', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Sulawesi Tengah',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Kaledo', category: 'Siang'),
      RecipeSeed(title: 'Uta Kelo', category: 'Siang'),
      RecipeSeed(title: 'Lalampa', category: 'Malam'),
      RecipeSeed(title: 'Palumara', category: 'Malam'),
      RecipeSeed(title: 'Sarabba Palu', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Sulawesi Barat',
    image: _breakfastImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Jepa', category: 'Sarapan'),
      RecipeSeed(title: 'Bau Piapi', category: 'Siang'),
      RecipeSeed(title: 'Pupuq Mandar', category: 'Malam'),
      RecipeSeed(title: 'Tetu', category: 'Siang'),
      RecipeSeed(title: 'Sarabba Mandar', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Sulawesi Selatan',
    image: _soupImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Coto Makassar', category: 'Sarapan', featured: true),
      RecipeSeed(title: 'Konro Bakar', category: 'Malam'),
      RecipeSeed(title: 'Pallubasa', category: 'Siang'),
      RecipeSeed(title: 'Sop Saudara', category: 'Siang'),
      RecipeSeed(title: 'Es Pisang Ijo', category: 'Minuman', saved: true),
    ],
  ),
  RegionCatalog(
    name: 'Sulawesi Tenggara',
    image: _vegImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Sinonggi', category: 'Siang'),
      RecipeSeed(title: 'Lapa-lapa', category: 'Sarapan'),
      RecipeSeed(title: 'Parende', category: 'Siang'),
      RecipeSeed(title: 'Kabuto', category: 'Malam'),
      RecipeSeed(title: 'Es Kelapa Buton', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Maluku',
    image: _vegImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Papeda Maluku', category: 'Sarapan'),
      RecipeSeed(title: 'Ikan Kuah Kuning', category: 'Siang'),
      RecipeSeed(title: 'Nasi Lapola', category: 'Siang'),
      RecipeSeed(title: 'Gohu Ikan', category: 'Malam'),
      RecipeSeed(title: 'Sagu Gula', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Maluku Utara',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Gohu Ikan Ternate', category: 'Malam'),
      RecipeSeed(title: 'Ikan Bakar Dabu-dabu', category: 'Siang'),
      RecipeSeed(title: 'Kohu-kohu', category: 'Siang'),
      RecipeSeed(title: 'Popaco', category: 'Sarapan'),
      RecipeSeed(title: 'Es Pala Tidore', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Papua',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Papeda Papua', category: 'Sarapan'),
      RecipeSeed(title: 'Ikan Bakar Manokwari', category: 'Siang'),
      RecipeSeed(title: 'Sagu Lempeng', category: 'Sarapan'),
      RecipeSeed(title: 'Udang Selingkuh', category: 'Malam'),
      RecipeSeed(title: 'Es Buah Merah', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Papua Barat',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Papeda Kuah Kuning', category: 'Sarapan'),
      RecipeSeed(title: 'Ikan Bungkus', category: 'Siang'),
      RecipeSeed(title: 'Aunu Senebre', category: 'Malam'),
      RecipeSeed(title: 'Kue Lontar Papua Barat', category: 'Minuman'),
      RecipeSeed(title: 'Jus Matoa', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Papua Selatan',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Ikan Bakar Merauke', category: 'Siang'),
      RecipeSeed(title: 'Sagu Sep', category: 'Sarapan'),
      RecipeSeed(title: 'Keladi Tumbuk', category: 'Malam'),
      RecipeSeed(title: 'Udang Bakar Wasur', category: 'Malam'),
      RecipeSeed(title: 'Es Kelapa Merauke', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Papua Tengah',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Aunuve Habre', category: 'Sarapan'),
      RecipeSeed(title: 'Keladi Rebus Paniai', category: 'Malam'),
      RecipeSeed(title: 'Ikan Kuah Asam Nabire', category: 'Siang'),
      RecipeSeed(title: 'Sate Ikan Danau', category: 'Malam'),
      RecipeSeed(title: 'Teh Matoa', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Papua Pegunungan',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Bakar Batu', category: 'Siang'),
      RecipeSeed(title: 'Ubi Tumbuk Wamena', category: 'Sarapan'),
      RecipeSeed(title: 'Sayur Pakis Pegunungan', category: 'Siang'),
      RecipeSeed(title: 'Daging Asap Honai', category: 'Malam'),
      RecipeSeed(title: 'Kopi Wamena', category: 'Minuman'),
    ],
  ),
  RegionCatalog(
    name: 'Papua Barat Daya',
    image: _grillImage,
    seeds: <RecipeSeed>[
      RecipeSeed(title: 'Ikan Kuah Kuning Sorong', category: 'Siang'),
      RecipeSeed(title: 'Papeda Sorong', category: 'Sarapan'),
      RecipeSeed(title: 'Sate Gurita Raja Ampat', category: 'Malam'),
      RecipeSeed(title: 'Tumis Matoa', category: 'Malam'),
      RecipeSeed(title: 'Es Kelapa Raja Ampat', category: 'Minuman'),
    ],
  ),
];

String _imageForCategory(String category) {
  switch (category) {
    case 'Sarapan':
      return _breakfastImage;
    case 'Siang':
      return _lunchImage;
    case 'Malam':
      return _dinnerImage;
    case 'Minuman':
      return _drinkImage;
    default:
      return _snackImage;
  }
}

String _difficultyFor(String category, int index) {
  switch (category) {
    case 'Sarapan':
      return index.isEven ? 'Mudah' : 'Sedang';
    case 'Siang':
      return index % 3 == 0 ? 'Sedang' : 'Mudah';
    case 'Malam':
      return index.isEven ? 'Sedang' : 'Mudah';
    case 'Minuman':
      return 'Mudah';
    default:
      return 'Mudah';
  }
}

String _timeFor(String category, int index) {
  switch (category) {
    case 'Sarapan':
      return '${20 + (index * 5)} Menit';
    case 'Siang':
      return '${35 + (index * 8)} Menit';
    case 'Malam':
      return '${25 + (index * 7)} Menit';
    case 'Minuman':
      return '${10 + (index * 3)} Menit';
    default:
      return '30 Menit';
  }
}

String _ratingFor(int index) {
  const List<String> ratings = <String>['4.6', '4.7', '4.8', '4.9', '4.8'];
  return ratings[index % ratings.length];
}

String _mainIngredientFor(String title, String category) {
  final String lower = title.toLowerCase();

  if (lower.contains('ikan') || lower.contains('patin') || lower.contains('ruan')) {
    return 'ikan segar';
  }
  if (lower.contains('udang')) {
    return 'udang segar';
  }
  if (lower.contains('kepiting')) {
    return 'kepiting';
  }
  if (lower.contains('gurita')) {
    return 'gurita';
  }
  if (lower.contains('ayam')) {
    return 'ayam';
  }
  if (lower.contains('sapi') || lower.contains('konro') || lower.contains('rendang')) {
    return 'daging sapi';
  }
  if (lower.contains('bandeng')) {
    return 'ikan bandeng';
  }
  if (lower.contains('soto')) {
    return 'daging atau ayam untuk kuah soto';
  }
  if (lower.contains('mie') || lower.contains('bakmi') || lower.contains('lakse')) {
    return 'mi basah atau mi telur';
  }
  if (lower.contains('nasi') || lower.contains('uduk') || lower.contains('gemuk')) {
    return 'beras';
  }
  if (lower.contains('bubur')) {
    return 'beras atau bubur nasi';
  }
  if (lower.contains('pempek') || lower.contains('tekwan') || lower.contains('otak-otak')) {
    return 'ikan giling';
  }
  if (lower.contains('tahu')) {
    return 'tahu putih';
  }
  if (lower.contains('tempe')) {
    return 'tempe';
  }
  if (lower.contains('cendol') || lower.contains('daluman')) {
    return 'cendol atau cincau hijau';
  }
  if (lower.contains('kopi')) {
    return 'kopi bubuk';
  }
  if (lower.contains('teh') || lower.contains('wedang')) {
    return 'teh atau rempah minuman';
  }
  if (lower.contains('kue') || lower.contains('bolu') || lower.contains('bika')) {
    return 'tepung, telur, dan santan';
  }
  if (category == 'Minuman') {
    return 'bahan utama minuman tradisional';
  }
  return 'bahan utama khas hidangan';
}

String _liquidBaseFor(String title, String category) {
  final String lower = title.toLowerCase();

  if (lower.contains('gulai') ||
      lower.contains('soto') ||
      lower.contains('kuah') ||
      lower.contains('pindang')) {
    return 'air kaldu dan santan';
  }
  if (lower.contains('es') || lower.contains('cendol') || lower.contains('wedang')) {
    return category == 'Minuman' ? 'air matang, santan, atau susu' : 'air matang';
  }
  if (lower.contains('mie') || lower.contains('bakmi')) {
    return 'air rebusan dan sedikit kaldu';
  }
  if (lower.contains('nasi') || lower.contains('uduk') || lower.contains('gemuk')) {
    return 'air dan santan';
  }

  return category == 'Minuman'
      ? 'air matang, santan, atau seduhan utama'
      : 'air, kaldu, atau santan sesuai kebutuhan';
}

String _signatureSpicesFor(String region) {
  if (region.contains('Aceh')) {
    return 'kapulaga, cengkih, dan lada';
  }
  if (region.contains('Sumatera') || region.contains('Riau') || region.contains('Jambi')) {
    return 'kunyit, lengkuas, serai, dan daun jeruk';
  }
  if (region.contains('Jakarta') || region.contains('Jawa')) {
    return 'ketumbar, bawang, kemiri, dan sedikit gula';
  }
  if (region.contains('Bali') || region.contains('Nusa Tenggara')) {
    return 'cabai, terasi, kencur, dan jeruk limau';
  }
  if (region.contains('Kalimantan')) {
    return 'bawang, lada, dan rempah harum lokal';
  }
  if (region.contains('Sulawesi')) {
    return 'cabai, daun jeruk, serai, dan perasan jeruk';
  }
  if (region.contains('Maluku') || region.contains('Papua')) {
    return 'kunyit, jahe, daun pandan, dan aroma segar setempat';
  }
  return 'bawang merah, bawang putih, jahe, dan rempah pilihan';
}

String _servingCompanionFor(String title, String category) {
  final String lower = title.toLowerCase();

  if (category == 'Minuman') {
    return 'disajikan dalam gelas saji dengan topping sesuai selera';
  }
  if (lower.contains('soto') || lower.contains('gulai') || lower.contains('kuah')) {
    return 'nasi hangat, sambal, dan jeruk limau';
  }
  if (lower.contains('sate') || lower.contains('ayam') || lower.contains('ikan bakar')) {
    return 'nasi hangat, lalapan, dan sambal';
  }
  if (lower.contains('mie') || lower.contains('bakmi') || lower.contains('lakse')) {
    return 'taburan bawang goreng, daun bawang, dan acar';
  }
  if (lower.contains('bubur')) {
    return 'cakwe, bawang goreng, dan sambal';
  }
  return 'pelengkap khas daerah dan sajian hangat';
}

String _proteinOrBaseAmountFor(String title, String category) {
  if (category == 'Minuman') {
    return '200 gram';
  }
  if (category == 'Sarapan') {
    return '250 gram';
  }
  if (category == 'Siang') {
    return '400 gram';
  }
  return '350 gram';
}

String _descriptionFor(RecipeSeed seed, String region) {
  final String spiceNote = _signatureSpicesFor(region);
  switch (seed.category) {
    case 'Sarapan':
      return '${seed.title} khas $region yang hangat, lembut, dan cocok untuk memulai hari dengan rasa lokal. Sajian ini biasanya terasa gurih seimbang, mudah dinikmati, dan pas dipadukan dengan pelengkap sederhana di meja sarapan. Nuansa bumbunya cenderung menonjolkan $spiceNote.';
    case 'Siang':
      return '${seed.title} dari $region dengan rasa kaya bumbu, pas untuk makan siang yang mengenyangkan. Karakter rasanya cenderung kuat, rempahnya terasa jelas, dan teksturnya nyaman disantap bersama nasi hangat. Sentuhan khas $region biasanya hadir lewat kombinasi $spiceNote.';
    case 'Malam':
      return '${seed.title} khas $region dengan karakter gurih dan aroma yang kuat untuk santap malam. Hidangan ini cocok disajikan hangat agar rasa bumbu, kuah, atau panggangannya lebih menonjol dan terasa akrab. Profil rasanya dibangun dari perpaduan $spiceNote.';
    case 'Minuman':
      return '${seed.title} dari $region yang segar dan ringan untuk menutup perjalanan rasa hari ini. Rasanya dibuat seimbang agar manis, gurih, atau harumnya tetap terasa tanpa berlebihan. Karakter minumannya tetap membawa sentuhan lokal melalui aroma $spiceNote.';
    default:
      return '${seed.title} adalah sajian khas $region yang menghadirkan rasa Indonesia yang akrab.';
  }
}

List<String> _ingredientsFor(RecipeSeed seed, String region) {
  final String mainIngredient = _mainIngredientFor(seed.title, seed.category);
  final String liquidBase = _liquidBaseFor(seed.title, seed.category);
  final String spices = _signatureSpicesFor(region);
  final String mainAmount = _proteinOrBaseAmountFor(seed.title, seed.category);

  switch (seed.category) {
    case 'Sarapan':
      return <String>[
        '$mainAmount $mainIngredient untuk ${seed.title.toLowerCase()}, dibersihkan dan disiapkan sesuai kebutuhan resep',
        '150 gram karbohidrat atau pendamping utama seperti nasi, lontong, mi, atau roti sesuai karakter hidangan',
        '4 siung bawang merah, iris tipis atau haluskan',
        '3 siung bawang putih, haluskan',
        '1 batang serai, 2 lembar daun salam, atau rempah aromatik lain sesuai gaya hidangan',
        '1 sendok makan minyak atau mentega untuk menumis bumbu',
        '2 batang daun bawang atau seledri, iris halus untuk aroma dan pelengkap',
        '1 sendok teh garam',
        '1/2 sendok teh gula untuk menyeimbangkan rasa',
        '1/2 sendok teh merica atau lada bubuk',
        '1 sendok teh ketumbar bubuk, kemiri halus, atau bumbu dasar lain yang cocok dengan ${seed.title.toLowerCase()}',
        '500 ml $liquidBase sesuai jenis hidangan',
        'Rempah khas daerah seperti $spices secukupnya',
        'Pelengkap sajian seperti bawang goreng, sambal, jeruk limau, acar, atau kerupuk secukupnya',
      ];
    case 'Siang':
      return <String>[
        '$mainAmount $mainIngredient untuk ${seed.title.toLowerCase()}, potong sesuai selera',
        '5 siung bawang merah',
        '4 siung bawang putih',
        '3 butir kemiri sangrai atau 1 sendok makan bumbu pengental sejenis',
        '2 buah cabai merah besar dan 3 cabai rawit, sesuaikan dengan tingkat pedas yang diinginkan',
        '1 ruas jahe dan 1 ruas kunyit, memarkan atau haluskan',
        '2 lembar daun salam, 2 lembar daun jeruk, dan 1 batang serai untuk memperkaya aroma',
        '1 ruas lengkuas atau kencur agar aroma masakan lebih dalam',
        '600 ml $liquidBase sesuai karakter masakan',
        '1 sendok teh garam, 1/2 sendok teh gula, dan 1/2 sendok teh lada',
        'Bumbu khas $region seperti $spices secukupnya',
        'Sayur pelengkap, kentang, tomat, atau taburan bawang goreng secukupnya untuk penyajian',
      ];
    case 'Malam':
      return <String>[
        '$mainAmount $mainIngredient untuk ${seed.title.toLowerCase()}, potong tipis atau sedang agar cepat matang',
        '4 siung bawang merah dan 3 siung bawang putih, iris atau haluskan',
        '2 buah cabai merah, 2 cabai rawit, atau lada hitam secukupnya',
        '1 ruas jahe atau lengkuas, memarkan untuk mengurangi aroma amis dan menambah wangi',
        '2 sendok makan kecap, saus, atau bumbu cair utama sesuai gaya masakan',
        '2 lembar daun jeruk atau daun bawang untuk menambah aroma akhir',
        '250 ml $liquidBase untuk menjaga kelembapan masakan',
        '1 sendok teh garam',
        '1/2 sendok teh gula',
        '1/2 sendok teh lada bubuk',
        'Rempah khas $region seperti $spices secukupnya',
        'Irisan daun bawang, bawang goreng, sambal, atau acar sebagai pelengkap saat penyajian',
      ];
    case 'Minuman':
      return <String>[
        '$mainAmount $mainIngredient untuk ${seed.title.toLowerCase()} seperti buah, cendol, sagu, kopi, teh, atau rempah',
        '500 ml $liquidBase sesuai jenis minuman',
        '3 sampai 4 sendok makan gula pasir, gula merah cair, atau pemanis lain sesuai selera',
        '1 lembar daun pandan, vanila, kayu manis, atau aroma tambahan lain bila diperlukan',
        '1 sejumput garam untuk menegaskan rasa manis atau gurih',
        '100 ml susu, santan, atau krimer bila minuman membutuhkan tekstur lebih lembut',
        'Bahan penegas aroma khas $region seperti $spices secukupnya',
        'Es batu secukupnya untuk sajian dingin atau air panas secukupnya untuk sajian hangat',
        'Pelengkap seperti irisan buah, selasih, kacang, keju, atau topping tradisional lainnya secukupnya',
      ];
    default:
      return <String>[
        'Bahan utama',
        'Bumbu dasar',
        'Pelengkap',
      ];
  }
}

List<String> _stepsFor(RecipeSeed seed, String region) {
  final String mainIngredient = _mainIngredientFor(seed.title, seed.category);
  final String companion = _servingCompanionFor(seed.title, seed.category);
  final String spices = _signatureSpicesFor(region);

  switch (seed.category) {
    case 'Sarapan':
      return <String>[
        'Siapkan semua bahan ${seed.title.toLowerCase()} khas $region, lalu cuci bersih $mainIngredient, iris bumbu, dan ukur air, santan, atau kaldu agar proses memasak lebih rapi.',
        'Panaskan sedikit minyak bila diperlukan, kemudian tumis bawang merah, bawang putih, dan bumbu aromatik sampai harum serta berubah sedikit keemasan.',
        'Masukkan $mainIngredient, aduk perlahan sampai seluruh permukaannya terkena bumbu dan mulai mengeluarkan aroma yang lebih kuat.',
        'Tuangkan air, kaldu, atau santan sedikit demi sedikit sambil diaduk supaya tekstur tetap halus dan bumbu tidak pecah.',
        'Tambahkan garam, gula, merica, serta sentuhan rempah seperti $spices, lalu masak dengan api sedang sampai bahan matang dan kuah atau adonan mencapai kekentalan yang diinginkan.',
        'Cicipi rasanya, lalu sesuaikan kembali gurih, manis, atau pedasnya agar lebih seimbang sebelum diangkat.',
        'Siapkan mangkuk atau piring saji, tata karbohidrat atau pelengkap utama terlebih dahulu bila ada, kemudian tuang hidangan di atasnya.',
        'Akhiri dengan taburan bawang goreng, irisan daun bawang, sambal, atau jeruk limau agar ${seed.title.toLowerCase()} terasa lebih segar saat disantap hangat bersama $companion.',
      ];
    case 'Siang':
      return <String>[
        'Bersihkan $mainIngredient untuk ${seed.title.toLowerCase()}, lalu potong sesuai ukuran saji agar mudah matang merata dan bumbu lebih cepat meresap.',
        'Haluskan atau iris seluruh bumbu dasar, kemudian tumis bersama daun aromatik seperti serai, salam, dan daun jeruk sampai harum dan matang sempurna.',
        'Masukkan $mainIngredient ke dalam tumisan bumbu, aduk sampai permukaannya berubah warna dan mulai menyerap rasa dasar dari rempah.',
        'Tuangkan air, kaldu, atau santan sesuai kebutuhan, lalu masak dengan api sedang sambil sesekali diaduk agar bagian bawah panci tidak mudah gosong.',
        'Tambahkan garam, gula, lada, dan bahan pelengkap lain seperti kentang, tomat, atau sayuran, kemudian lanjutkan memasak sampai kuah menyusut atau daging empuk.',
        'Jika masakan berkuah, biarkan mendidih perlahan beberapa menit agar rasa bumbu semakin dalam; jika masakan kering, aduk sampai bumbu melapisi bahan dengan rata.',
        'Cicipi dan koreksi rasa hingga gurih, pedas, dan aroma rempah seperti $spices terasa seimbang sesuai karakter masakan khas $region.',
        'Sajikan ${seed.title.toLowerCase()} selagi hangat bersama $companion agar pengalaman makan siangnya terasa lengkap.',
      ];
    case 'Malam':
      return <String>[
        'Siapkan $mainIngredient dan pelengkap untuk ${seed.title.toLowerCase()}, lalu potong dengan ukuran sedang agar mudah diolah dan tetap nyaman disantap pada malam hari.',
        'Tumis bawang, cabai, jahe, atau rempah utama sampai harum dan matang supaya dasar rasanya kuat sejak awal.',
        'Masukkan $mainIngredient, lalu aduk dengan api sedang sampai bagian luarnya setengah matang dan mulai menyatu dengan bumbu tumis.',
        'Tambahkan kecap, saus, atau kuah dasar sedikit demi sedikit sambil terus diaduk agar rasa merata dan warna masakan terlihat lebih kaya.',
        'Masukkan air atau kaldu secukupnya bila diperlukan, lalu masak hingga bahan empuk, kuah meresap, atau permukaan masakan sedikit mengilap.',
        'Bumbui dengan garam, gula, lada, dan sedikit sentuhan $spices, kemudian kecilkan api agar rasa menyatu tanpa membuat bahan terlalu kering atau terlalu lembek.',
        'Cicipi dan sesuaikan rasa akhir, terutama keseimbangan gurih, pedas, dan aroma smokey atau rempah yang menjadi ciri hidangan malam.',
        'Sajikan ${seed.title.toLowerCase()} saat masih hangat bersama $companion agar rasa malamnya terasa penuh.',
      ];
    case 'Minuman':
      return <String>[
        'Siapkan bahan utama untuk ${seed.title.toLowerCase()}, terutama $mainIngredient, lalu cuci, seduh, rebus, atau olah terlebih dahulu sesuai jenis minumannya.',
        'Rebus air, santan, atau cairan dasar bersama gula, daun pandan, kayu manis, atau aroma tambahan lain sampai rasa manis dan wanginya keluar.',
        'Jika menggunakan bahan seperti cendol, sagu, kopi, teh, atau rempah, masukkan pada tahap yang sesuai lalu aduk perlahan agar teksturnya tetap terjaga.',
        'Tambahkan sejumput garam atau sedikit susu dan santan bila ingin rasa yang lebih bulat, lembut, dan tidak terasa datar, lalu masukkan sentuhan aroma seperti $spices bila cocok.',
        'Saring cairan bila perlu agar hasil minuman lebih halus dan nyaman diminum.',
        'Siapkan gelas saji, lalu isi dengan es batu untuk versi dingin atau gunakan gelas tahan panas untuk versi hangat.',
        'Tuang minuman secara perlahan, kemudian tambahkan topping seperti buah, selasih, kacang, atau es tambahan sesuai karakter ${seed.title.toLowerCase()}.',
        'Cicipi sekali lagi sebelum disajikan agar tingkat manis, gurih, dan suhu minuman benar-benar pas, lalu sajikan bersama $companion.',
      ];
    default:
      return <String>[
        'Siapkan bahan utama.',
        'Masak sampai matang.',
        'Sajikan hangat.',
      ];
  }
}

Recipe _recipeFromSeed(
  String region,
  RecipeSeed seed,
  int index,
) {
  return Recipe(
    title: seed.title,
    region: region,
    description: _descriptionFor(seed, region),
    time: _timeFor(seed.category, index),
    rating: _ratingFor(index),
      difficulty: _difficultyFor(seed.category, index),
      category: seed.category,
      image: _imageForCategory(seed.category),
      tags: <String>[region, seed.category, 'Tradisional'],
      ingredients: _ingredientsFor(seed, region),
      steps: _stepsFor(seed, region),
      featured: seed.featured,
      saved: seed.saved,
    );
  }

final List<RegionSpot> regionSpots = _regionCatalog
    .map(
      (RegionCatalog region) => RegionSpot(
        name: region.name,
        image: region.image,
      ),
    )
    .toList();

const Map<String, String> regionToIsland = <String, String>{
  'Aceh': 'Sumatera',
  'Sumatera Utara': 'Sumatera',
  'Sumatera Barat': 'Sumatera',
  'Riau': 'Sumatera',
  'Kepulauan Riau': 'Sumatera',
  'Jambi': 'Sumatera',
  'Sumatera Selatan': 'Sumatera',
  'Bangka Belitung': 'Sumatera',
  'Bengkulu': 'Sumatera',
  'Lampung': 'Sumatera',
  'Banten': 'Jawa',
  'Jakarta': 'Jawa',
  'Jawa Barat': 'Jawa',
  'Jawa Tengah': 'Jawa',
  'DI Yogyakarta': 'Jawa',
  'Jawa Timur': 'Jawa',
  'Bali': 'Bali & Nusa Tenggara',
  'Nusa Tenggara Barat': 'Bali & Nusa Tenggara',
  'Nusa Tenggara Timur': 'Bali & Nusa Tenggara',
  'Kalimantan Barat': 'Kalimantan',
  'Kalimantan Tengah': 'Kalimantan',
  'Kalimantan Selatan': 'Kalimantan',
  'Kalimantan Timur': 'Kalimantan',
  'Kalimantan Utara': 'Kalimantan',
  'Sulawesi Utara': 'Sulawesi',
  'Gorontalo': 'Sulawesi',
  'Sulawesi Tengah': 'Sulawesi',
  'Sulawesi Barat': 'Sulawesi',
  'Sulawesi Selatan': 'Sulawesi',
  'Sulawesi Tenggara': 'Sulawesi',
  'Maluku': 'Maluku',
  'Maluku Utara': 'Maluku',
  'Papua': 'Papua',
  'Papua Barat': 'Papua',
  'Papua Selatan': 'Papua',
  'Papua Tengah': 'Papua',
  'Papua Pegunungan': 'Papua',
  'Papua Barat Daya': 'Papua',
};

const List<String> islandFilters = <String>[
  'Semua',
  'Sumatera',
  'Jawa',
  'Bali & Nusa Tenggara',
  'Kalimantan',
  'Sulawesi',
  'Maluku',
  'Papua',
];

String islandForRegion(String region) => regionToIsland[region] ?? 'Lainnya';

final List<Recipe> recipes = _regionCatalog
    .expand(
      (RegionCatalog region) => region.seeds.asMap().entries.map(
            (MapEntry<int, RecipeSeed> entry) =>
                _recipeFromSeed(region.name, entry.value, entry.key),
          ),
    )
    .toList();

List<Recipe> recipesForCategory(String category) {
  if (category == 'Semua') {
    return recipes;
  }
  return recipes.where((Recipe recipe) => recipe.category == category).toList();
}

List<Recipe> recipesForRegion(String region) {
  return recipes.where((Recipe recipe) => recipe.region == region).toList();
}

List<Recipe> searchRecipes(
  String query, {
  String category = 'Semua',
}) {
  final String normalizedQuery = query.trim().toLowerCase();
  final Iterable<Recipe> source = category == 'Semua'
      ? recipes
      : recipes.where((Recipe recipe) => recipe.category == category);

  if (normalizedQuery.isEmpty) {
    return source.toList();
  }

  return source.where((Recipe recipe) {
    final bool matchesTitle = recipe.title.toLowerCase().contains(normalizedQuery);
    final bool matchesRegion = recipe.region.toLowerCase().contains(normalizedQuery);
    final bool matchesIngredients = recipe.ingredients.any(
      (String ingredient) => ingredient.toLowerCase().contains(normalizedQuery),
    );

    return matchesTitle || matchesRegion || matchesIngredients;
  }).toList();
}

List<Recipe> get featuredRecipes =>
    recipes.where((Recipe recipe) => recipe.featured).toList();

List<Recipe> get savedRecipes =>
    recipes.where((Recipe recipe) => recipe.saved).toList();
