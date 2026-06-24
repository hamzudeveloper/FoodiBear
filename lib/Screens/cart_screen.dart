import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';
import 'package:foodi_bear/Screens/checkout_screen.dart';

// --- DATA MODEL ---
// Defines what data structure an individual Cart Item must follow
class CartItem {
  final String id;
  final String title;
  final String option;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.option,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // --- STATE MANAGEMENT ---
  // Initializing mock cart data matching the UI mockup
  final List<CartItem> cartItems = [
    CartItem(
      id: '1',
      title: 'Truffle Cream Pasta',
      option: 'Extra Parmesan',
      price: 18.50,
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1645112411341-6c4fd023714a?q=80&w=300&auto=format&fit=crop',
    ),
    CartItem(
      id: '2',
      title: 'Berry Blast Bowl',
      option: 'Acai Base',
      price: 12.99,
      quantity: 1,
      imageUrl:
          'https://images.unsplash.com/photo-1590301157890-4810ed352733?q=80&w=300&auto=format&fit=crop',
    ),
  ];

  final TextEditingController promoController = TextEditingController();

  // --- HANDLER FUNCTIONS ---
  // Updates item quantity safely and triggers UI re-render
  void _updateQuantity(String id, int change) {
    setState(() {
      final item = cartItems.firstWhere((element) => element.id == id);
      final newQty = item.quantity + change;
      if (newQty > 0) {
        item.quantity = newQty;
      }
    });
  }

  // Completely removes an item from the cart list
  void _removeItem(String id) {
    setState(() {
      cartItems.removeWhere((element) => element.id == id);
    });
  }

  // --- CALCULATION LOGIC ---
  // Dynamic getters that auto-calculate based on state array
  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get deliveryFee => 0.00; // Hardcoded FREE delivery per design UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B121F),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=100",
            ),
          ),
        ),
        title: Text(
          'Foodi Bear',
          style: TextStyle(
            color: AppColors.heading,
            fontSize: AppSizes.textXLarge,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ), // Main Deep Space Blue Background
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable body content to prevent rendering overflow
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // // --- HEADER BAR ---
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         const CircleAvatar(
                  //           radius: 20,
                  //           backgroundImage: NetworkImage(
                  //             'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=100',
                  //           ),
                  //         ),
                  //         const SizedBox(width: 12),
                  //         Text(
                  //           'Foodi Bear',
                  //           style: TextStyle(
                  //             color: AppColors.heading,
                  //             fontSize: AppSizes.textXLarge,
                  //             fontWeight: FontWeight.bold,
                  //             letterSpacing: 0.5,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Container(
                  //       padding: const EdgeInsets.all(8),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white.withValues(alpha: 0.05),
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: const Icon(
                  //         Icons.shopping_bag_outlined,
                  //         color: AppColors.heading,
                  //         size: 22,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 24),

                  // --- TITLE AND COUNTER BADGE ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF161F30),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${cartItems.length} Items',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // --- CART ITEMS LIST ---
                  ListView.builder(
                    shrinkWrap:
                        true, // Forces ListView to use only needed height
                    physics:
                        const NeverScrollableScrollPhysics(), // Disables inner scrolling conflict
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF161F30,
                          ), // Dark Card Background
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.03),
                          ),
                        ),
                        child: Row(
                          children: [
                            // Product Image Thumbnail
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                item.imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Meta Details & Action Counters
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              item.option,
                                              style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '\$${item.price.toStringAsFixed(2)}',
                                        style: const TextStyle(
                                          color: Color(0xFFFF9F43),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Counter Control Wrapper
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF1F2C42),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              constraints:
                                                  const BoxConstraints(),
                                              padding: const EdgeInsets.all(4),
                                              icon: const Icon(
                                                Icons.remove,
                                                size: 14,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () =>
                                                  _updateQuantity(item.id, -1),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 8.0,
                                                  ),
                                              child: Text(
                                                '${item.quantity}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              constraints:
                                                  const BoxConstraints(),
                                              padding: const EdgeInsets.all(4),
                                              icon: const Icon(
                                                Icons.add,
                                                size: 14,
                                                color: Colors.grey,
                                              ),
                                              onPressed: () =>
                                                  _updateQuantity(item.id, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Trash Action Button
                                      GestureDetector(
                                        onTap: () => _removeItem(item.id),
                                        child: const Icon(
                                          Icons.delete_outline,
                                          size: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  // --- DELIVERY SECTION ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery Address',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            color: Color(0xFFFF9F43),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161F30),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1F2C42),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Color(0xFFFF9F43),
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '42 Galactic Avenue, Sector 7, Urbania',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- PROMO CODE INPUT BAR ---
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: TextField(
                              controller: promoController,
                              style: const TextStyle(
                                color: AppColors.secondary,
                                fontSize: 14,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Add promo code',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2D3748),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Apply',
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
                  const SizedBox(height: 20),

                  // --- PRICING BREAKDOWN MATRICES ---
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ), // Leaves space for floating checkout CTA
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Subtotal',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '\$${subtotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Fee',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'FREE',
                              style: TextStyle(
                                color: Color(0xFF4CD137),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF7A00), Color(0xFFFFB800)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withValues(alpha: 0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Proceed to Checkout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- FLOATING CHECKOUT CTA BUTTON ---

            // --- APP LEVEL COMPONENT TAB NAVIGATION BAR ---
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //     height: 64,
            //     decoration: const BoxDecoration(
            //       color: Color(0xFF0B121F),
            //       border: Border(
            //         top: BorderSide(color: Color(0xFF161F30), width: 1),
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         _buildNavItem(Icons.explore_outlined, 'Explore', false),
            //         _buildNavItem(Icons.search, 'Search', false),
            //         _buildNavItem(Icons.shopping_bag, 'Orders', true),
            //         _buildNavItem(
            //           Icons.account_balance_wallet_outlined,
            //           'Wallet',
            //           false,
            //         ),
            //         _buildNavItem(Icons.person_outline, 'Profile', false),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
  // Quick Navigation Item Helper Widget
  // Widget _buildNavItem(IconData icon, String label, bool isActive) {
  //   final color = isActive ? const Color(0xFFFF9F43) : Colors.blueGrey[600];
  //   return InkWell(
  //     onTap: () {
        
  //     },
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Icon(icon, color: color, size: 20),
  //         const SizedBox(height: 4),
  //         Text(
  //           label,
  //           style: TextStyle(
  //             color: color,
  //             fontSize: 10,
  //             fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
