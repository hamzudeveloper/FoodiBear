import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Screens/detailProduct_screen.dart';
import 'package:foodi_bear/shared/card_data.dart';

class Popularmenucard extends StatefulWidget {
  const Popularmenucard({super.key});

  @override
  State<Popularmenucard> createState() => _PopularmenucardState();
  // ^ Renamed to match the widget name (Popularmenucard -> _PopularmenucardState).
  //   This is just a Dart naming convention, not a functional bug.
}

class _PopularmenucardState extends State<Popularmenucard> {
  // A simple list of food items. In a real app this would probably
  // come from a database or API, but a static list is fine for now.
  static final List<Map<String, String>> food = [
    {
      "id": "1",
      "Title": "Truffle Cream Pasta",
      "Price": "\$18.50",
      "Image": "assets/pizza.png",
    },
    {
      "id": "2",
      "Title": "Berry Blast Bowl",
      "Price": "\$12.99",
      "Image": "assets/deal1.png",
    },
    {
      "id": "3",
      "Title": "Spicy Tuna Poke",
      "Price": "\$16.20",
      "Image": "assets/burger.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // FIX: A horizontal ListView needs a fixed height, because it's
    // being placed where Flutter would otherwise give it infinite height.
    // Without this SizedBox, the app crashes with a layout error.
    return SizedBox(
      height: 280, // enough room for image + title + price + button
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: food.length,
        itemBuilder: (context, index) {
          // Using a ValueKey helps Flutter tell list items apart
          // (good practice, not strictly required here).
          return buildCard(food[index], key: ValueKey(food[index]["id"]));
        },
      ),
    );
  }

  Widget buildCard(Map<String, String> item, {Key? key}) {
    return Container(
      key: key,
      width: 160, // give the card itself a fixed width too
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // don't take more height than needed
          children: [
            // --- Image (tappable to open details) ---
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: () => _openDetails(context, item),
                child: Image.asset(
                  item["Image"]!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 130,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // --- Title ---
            Text(
              item["Title"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 5),

            // --- Price + Add-to-cart button, side by side ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item["Price"]!,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 36,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () => _addToCart(item),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.add, size: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Pulled navigation logic into its own method — easier to read,
  // and easier to test/reuse later.
  void _openDetails(BuildContext context, Map<String, String> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailScreen(
          id: item["id"]!,
          title: item["Title"]!,
          image: item["Image"]!,
          price: item["Price"]!,
        ),
      ),
    );
  }

  // Pulled cart logic into its own method for the same reason.
  void _addToCart(Map<String, String> item) {
    CartData.addToCart(
      id: item["Title"]!,
      title: item["Title"]!,
      price: double.parse(item["Price"]!.replaceAll('\$', '')),
      imageUrl: item["Image"]!,
      option: "Some Details about the product",
    );
  }
}
