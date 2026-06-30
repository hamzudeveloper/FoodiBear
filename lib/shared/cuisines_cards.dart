import 'package:flutter/material.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Burger", "icon": Icons.lunch_dining},
      {"title": "Pizza", "icon": Icons.local_pizza},
      {"title": "Asian", "icon": Icons.ramen_dining},
      {"title": "Drinks", "icon": Icons.local_drink},
      {"title": "Desserts", "icon": Icons.icecream},
      {"title": "Salads", "icon": Icons.eco},
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
          icon: categories[index]["icon"] as IconData,
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

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
          Icon(icon, color: Color(0xffff9b71), size: 28),

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
