import 'package:flutter/material.dart';

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

  const CategoryCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff182235),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Color(0xff26344d)),
      ),

      padding: EdgeInsets.all(12),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: 45, height: 45, fit: BoxFit.cover),

          Spacer(),

          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
