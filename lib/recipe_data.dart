// recipe_data.dart

final Map<String, List<Map<String, dynamic>>> allRecipes = {
  'Sarapan': [
    {
      'title': 'Nasi Uduk Betawi',
      'time': '40 Menit',
      'rating': '4.9',
      'image': 'https://images.unsplash.com/photo-1626074353765-517a681e40be?auto=format&fit=crop&w=800&q=80',
      'ingredients': [
        '2 cup Beras',
        '400ml Santan kental',
        '2 lembar Daun salam',
        '1 batang Serai (geprek)',
        'Garam secukupnya',
      ],
      'steps': [
        'Cuci bersih beras, masukkan ke dalam rice cooker.',
        'Campurkan santan, daun salam, serai, dan garam. Aduk rata.',
        'Masak nasi hingga matang sempurna.',
      ],
    },
    {
      'title': 'Bubur Ayam Kuning',
      'time': '50 Menit',
      'rating': '4.7',
      'image': 'https://images.unsplash.com/photo-1626074353765-517a681e40be?auto=format&fit=crop&w=800&q=80',
      'ingredients': [
        '1 mangkuk Nasi putih',
        '100gr Ayam suwir',
        '2 siung Bawang putih (untuk kuah)',
      ],
      'steps': [
        'Masak kembali nasi dengan banyak air hingga menjadi bubur lembut.',
        'Tumis bumbu kuah kuning (kunyit & bawang putih), tambahkan kaldu.',
        'Siram kuah kuning ke atas bubur panas.',
      ],
    },
  ],
  'Siang': [
    {
      'title': 'Ayam Bakar Madu',
      'time': '45 Menit',
      'rating': '4.9',
      'image': 'https://images.unsplash.com/photo-1598514982205-f36b96d1e8d4?auto=format&fit=crop&w=800&q=80',
      'ingredients': [
        '500gr Daging ayam',
        '3 sdm Madu',
        '2 sdm Kecap manis',
      ],
      'steps': [
        'Cuci bersih ayam, lumuri dengan garam dan lada.',
        'Oleskan campuran madu ke seluruh bagian ayam.',
        'Bakar ayam di atas teflon atau arang hingga matang kecoklatan.',
      ],
    },
  ],
  'Malam': [
     {
      'title': 'Nasi Goreng Spesial',
      'time': '30 Menit',
      'rating': '4.8',
      'image': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?auto=format&fit=crop&w=800&q=80',
      'ingredients': [
        '1 piring Nasi putih',
        '2 butir Telur ayam',
        '3 siung Bawang merah',
      ],
      'steps': [
        'Haluskan bawang merah dan bawang putih.',
        'Panaskan minyak, tumis bumbu halus hingga harum.',
        'Masukkan telur, orak-arik hingga matang.',
      ],
    },
  ],
  'Minuman': [
    {
      'title': 'Es Teh Leci',
      'time': '5 Menit',
      'rating': '4.6',
      'image': 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=800&q=80',
      'ingredients': [
        '1 kantong Teh celup',
        '2 sdm Gula pasir',
        '4 buah Buah leci kalengan',
      ],
      'steps': [
        'Seduh teh celup dengan sedikit air panas, tambahkan gula.',
        'Siapkan gelas, masukkan buah leci dan es batu.',
        'Tuangkan seduhan teh ke dalam gelas.',
      ],
    },
  ]
};