import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/shared/category_card.dart';

class CategoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> burgers;
  CategoryScreen({super.key, required this.burgers});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Foodi Bear"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: burgers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  image: burgers[index]["image"],
                  title: burgers[index]["name"],
                  price: "\$${burgers[index]["price"]}",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
