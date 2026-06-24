import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFB088),
          ), // Peach/coral back arrow
          onPressed: () {},
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFB088),
          ),
        ),
        centerTitle: true,
      ),
      // Scaffold body uses a Stack so we can overlay the bottom button perfectly
      body: Stack(
        children: [
          // 1. Scrollable Content Area
          ListView(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: 100.0,
            ), // Extra bottom padding so content doesn't get hidden behind the button
            children: [
              _buildSectionTitle('Order Summary'),
              _buildOrderSummaryCard(),

              const SizedBox(height: 24),
              _buildSectionTitle('Delivery Speed'),
              _buildDeliverySpeedSection(),

              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSectionTitle('Payment'),
                  const Text(
                    'Manage',
                    style: TextStyle(color: Color(0xFFFFB088), fontSize: 14),
                  ),
                ],
              ),
              _buildPaymentSection(),

              const SizedBox(height: 24),
              _buildPriceBreakdown(),
            ],
          ),

          // 2. Fixed Bottom Place Order Button
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: _buildPlaceOrderButton(),
          ),
        ],
      ),
    );
  }

  // Helper method to keep text styling consistent for headers
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  // --- ORDER SUMMARY CARD ---
  Widget _buildOrderSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161F30), // Slightly lighter blue for contrast
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          _buildFoodItemRow('Space Truffle Burger', '1x Unit', '\$24.00'),
          const Divider(
            color: Colors.white10,
            height: 24,
          ), // Subtle separation line
          _buildFoodItemRow('Stellar Fries', '1x Regular', '\$8.50'),
        ],
      ),
    );
  }

  Widget _buildFoodItemRow(String name, String quantity, String price) {
    return Row(
      children: [
        // Simulated burger/fries image container
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.fastfood, color: Colors.amber),
        ),
        const SizedBox(width: 16),
        // Item detail text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                quantity,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: Color(0xFFFFB088),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // --- DELIVERY SPEED SECTION ---
  Widget _buildDeliverySpeedSection() {
    return Row(
      children: [
        // Standard Delivery Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF161F30),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.transparent, width: 1.5),
            ),
            child: Column(
              children: [
                const Icon(Icons.shuffle, color: Colors.white70),
                const SizedBox(height: 8),
                const Text(
                  'Standard',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const Text(
                  '30-45 mins',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'FREE',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Express Delivery Card (Selected state highlighted)
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF161F30),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFFFB088).withValues(alpha: 0.3),
                width: 1.5,
              ), // Highlight border
            ),
            child: Column(
              children: [
                const Icon(Icons.rocket_launch, color: Color(0xFFFFB088)),
                const SizedBox(height: 8),
                const Text(
                  'Express',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '15-20 mins',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE65100),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '+ \$5.00',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- PAYMENT METHOD SECTION ---
  Widget _buildPaymentSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161F30),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          _buildPaymentRow(
            Icons.apps,
            'Apple Pay',
            'Instant Secure Checkout',
            false,
          ),
          const Divider(color: Colors.white10, height: 24),
          _buildPaymentRow(
            Icons.wallet,
            'Bear Wallet',
            'Balance: \$124.50',
            true,
          ), // Selected
          const Divider(color: Colors.white10, height: 24),
          _buildPaymentRow(Icons.credit_card, 'Mastercard', '•••• 8821', false),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(
    IconData icon,
    String title,
    String subtitle,
    bool isSelected,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFE65100) : Colors.black26,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: isSelected ? const Color(0xFFFFB088) : Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        // Custom Radio Indicator
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? const Color(0xFFFFB088) : Colors.grey,
              width: 2,
            ),
          ),
          child: isSelected
              ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFB088),
                    ),
                  ),
                )
              : null,
        ),
      ],
    );
  }

  // --- PRICE BREAKDOWN ---
  Widget _buildPriceBreakdown() {
    return Column(
      children: [
        _buildPriceRow('Subtotal', '\$32.50', false),
        const SizedBox(height: 8),
        _buildPriceRow('Delivery Fee (Express)', '\$5.00', false),
        const SizedBox(height: 8),
        _buildPriceRow('Tax & Service', '\$0.99', false),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Divider(color: Colors.white10),
        ),
        _buildPriceRow('Total', '\$37.49', true),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, bool isTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 24 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.white : Colors.grey,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 24 : 16,
            fontWeight: FontWeight.bold,
            color: isTotal ? const Color(0xFFFFB088) : Colors.white,
          ),
        ),
      ],
    );
  }

  // --- BOTTOM PLACE ORDER BUTTON ---
  Widget _buildPlaceOrderButton() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFE65100),
            Colors.amber,
          ], // Clean glowing gradient effect
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Place Order • \$37.49',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
