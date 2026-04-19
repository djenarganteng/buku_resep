import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. FOTO MASAKAN
            Image.network(
              recipe['image'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: double.infinity,
                height: 300,
                color: Colors.orange.shade100,
                child: const Icon(Icons.broken_image, size: 50, color: Colors.orange),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. JUDUL MASAKAN
                  Text(
                    recipe['title'],
                    style: const TextStyle(
                      fontSize: 26, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Text(recipe['time'], style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 15),
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 5),
                      Text(recipe['rating'], style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  
                  const Divider(height: 40, thickness: 1),

                  // 3. BAHAN-BAHAN
                  const Text(
                    'Bahan-bahan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                    recipe['ingredients'].length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 8, color: Colors.orange),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              recipe['ingredients'][index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 4. LANGKAH-LANGKAH
                  const Text(
                    'Langkah-langkah',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(
                    recipe['steps'].length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.orange.shade100,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 12, 
                                fontWeight: FontWeight.bold, 
                                color: Colors.orange
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              recipe['steps'][index],
                              style: const TextStyle(fontSize: 16, height: 1.4),
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
        ),
      ),
    );
  }
}