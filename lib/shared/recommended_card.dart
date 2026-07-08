import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Screens/detailProduct_screen.dart';
import 'package:foodi_bear/shared/card_data.dart';

class RecommendedCard extends StatefulWidget {
  const RecommendedCard({super.key});

  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  static final food = [
    {
      "Title": "Truffle Cream Pasta",
      "Price": "\$18.50",
      "Image": "assets/pizza.png",
    },
    {
      "Title": "Berry Blast Bowl",
      "Price": "\$12.99",
      "Image": "assets/deal1.png",
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
      height: 150,
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

              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailScreen(
                        title: item["Title"]!,
                        image: item["Image"]!,
                        price: item["Price"]!,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(item["Image"]!, fit: BoxFit.contain),
                ),
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
                  onPressed: () {
                    CartData.addToCart(
                      id: item["Title"]!,
                      title: item["Title"]!,
                      price: double.parse(item["Price"]!.replaceAll('\$', '')),
                      imageUrl: item["Image"]!,
                      option: "Some Details about the product",
                    );
                  },
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
