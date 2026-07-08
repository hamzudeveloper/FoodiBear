// import 'package:flutter/material.dart';

// class CartItem {
//   final String id;
//   final String title;
//   final String option;
//   final double price;
//   int quantity;
//   final String imageUrl;

//   CartItem({
//     required this.id,
//     required this.title,
//     this.option = '',
//     required this.price,
//     this.quantity = 1,
//     required this.imageUrl,
//   });

//   // Derived instead of stored separately — no more manual syncing bugs
//   double get updatedPrice => price * quantity;
// }

// class CartService extends ChangeNotifier {
//   CartService._internal();
//   static final CartService instance = CartService._internal();

//   final List<CartItem> _cartItems = [];
//   List<CartItem> get cartItems => _cartItems;

//   /// Call this from ANY "Add to Cart" button anywhere in the app.
//   void addToCart({
//     required String id,
//     required String title,
//     required double price,
//     required String imageUrl,
//     String option = '',
//     int quantity = 1,
//   }) {
//     final index = _cartItems.indexWhere((item) => item.id == id);
//     if (index != -1) {
//       // Already in cart -> just bump the quantity
//       _cartItems[index].quantity += quantity;
//     } else {
//       _cartItems.add(CartItem(
//         id: id,
//         title: title,
//         price: price,
//         imageUrl: imageUrl,
//         option: option,
//         quantity: quantity,
//       ));
//     }
//     notifyListeners();
//   }

//   void updateQuantity(String id, int change) {
//     final item = _cartItems.firstWhere((e) => e.id == id);
//     final newQty = item.quantity + change;
//     if (newQty > 0) item.quantity = newQty;
//     notifyListeners();
//   }

//   void removeItem(String id) {
//     _cartItems.removeWhere((e) => e.id == id);
//     notifyListeners();
//   }

//   double get subtotal =>
//       _cartItems.fold(0, (sum, item) => sum + item.updatedPrice);
// }