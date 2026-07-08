import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Appsizes;

class FoodCategory extends StatelessWidget {
  const FoodCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Burger", "image": "assets/burger.png"},
      {"title": "Pizza", "image": "assets/pizza.png"},
      {"title": "Asian", "image": "assets/asian.png"},
      {"title": "Drinks", "image": "assets/drinks.png"},
      {"title": "Desserts", "image": "assets/desserts.png"},
      {"title": "Salads", "image": "assets/salads.png"},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return CategoryCard(
          title: categories[index]["title"] as String,
          image: categories[index]["image"] as String,
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xff182235),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Color(0xff26344d)),
        ),

        padding: EdgeInsets.all(6),

        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),

            Appsizes.SizedBox(height: 8),

            Positioned(
              bottom: 0,
              right: 10,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
