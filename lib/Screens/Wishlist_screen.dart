import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  int quantity;
  final String imageUrl;
  final String option;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
    required this.option,
  });

  double get updatedPrice => price * quantity;
}

class FavouriteCard {
  // A single static list shared by the whole app.
  // "static" means we don't need an instance of CartData to use it —
  // just call CartData.cartItems from anywhere.
  static List<CartItem> cartItems = [];

  static void addToCart({
    required String id,
    required String title,
    required double price,
    required String imageUrl,
    required String option,
  }) {
    // If it's already in the cart, just bump the quantity
    for (var item in cartItems) {
      if (item.id == id) {
        item.quantity++;
        return;
      }
    }
    // Otherwise add it as a new item
    cartItems.add(
      CartItem(
        id: id,
        title: title,
        price: price,
        imageUrl: imageUrl,
        option: option,
      ),
    );
  }
}

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = FavouriteCard.cartItems;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Wishlist')),
      body: items.isEmpty
          ? const Center(child: Text('No items in wishlist'))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => FavouriteFoodCard(items[index]),
            ),
    );
  }
}

Widget FavouriteFoodCard(CartItem item) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    child: ListTile(
      leading: SizedBox(
        width: 56,
        height: 56,
        child: buildImage(item.imageUrl),
      ),
      title: Text(item.title),
      subtitle: Text(item.option),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('\$${item.price.toStringAsFixed(2)}'),
          Text('Qty: ${item.quantity}'),
        ],
      ),
    ),
  );
}

Widget buildImage(String image) {
  return image.startsWith('http')
      ? Image.network(image, fit: BoxFit.cover)
      : Image.asset(image, fit: BoxFit.cover);
}
