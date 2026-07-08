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

class CartData {
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
      CartItem(id: id, title: title, price: price, imageUrl: imageUrl, option: option),
    );
  }

  static void updateQuantity(String id, int change) {
    for (var item in cartItems) {
      if (item.id == id) {
        if (item.quantity + change > 0) {
          item.quantity += change;
        }
        break;
      }
    }
  }

  static void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  static double get subtotal {
    double total = 0;
    for (var item in cartItems) {
      total += item.updatedPrice;
    }
    return total;
  }
}
