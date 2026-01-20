import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final double rating;    

  const DetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.rating, 
  });

  Widget buildStars(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();     
    bool halfStar = (rating - fullStars) >= 0.5; 

    for (int i = 0; i < fullStars; i++) {
      stars.add(const Icon(Icons.star, color: Colors.orange, size: 20));
    }

    if (halfStar) {
      stars.add(const Icon(Icons.star_half, color: Colors.orange, size: 20));
    }

  
    while (stars.length < 5) {
      stars.add(const Icon(Icons.star_border, color: Colors.orange, size: 20));
    }

    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(right: 16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      buildStars(rating),
                      const SizedBox(width: 8),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Kembali"),
        ),
      ),
    );
  }
}
