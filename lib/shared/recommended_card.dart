import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class RecommendedCard extends StatefulWidget {
  const RecommendedCard({super.key});

  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  final food = [
    {
      "Title": "Truffle Cream Pasta",
      "Price": "\$18.50",
      "Image": "assets/burger.png",
    },
    {
      "Title": "Berry Blast Bowl",
      "Price": "\$12.99",
      "Image": "assets/burger.png",
    },
    {
      "Title": "Spicy Tuna Poke",
      "Price": "\$16.20",
      "Image": "assets/burger.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 201,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: food.length,

        itemBuilder: (context, index) {
          return buildCard(food[index]);
        },
      ),
    );
  }

  Widget buildCard(Map<String, String> item) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Padding(
        padding: EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.asset(
                item["Image"]!,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 8),

            Text(
              item["Title"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),

            SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item["Price"]!,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: AppColors.borderSecondary,
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
