import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedPaymentIndex = 1;
  bool isSelected = false;

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
          onPressed: () {
            Navigator.pop(context);
          },
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Payment Methods",
              style: TextStyle(fontSize: 30, color: AppColors.grey),
            ),
            buildPaymentTile('Credit Card', Icons.credit_card, 0),
            SizedBox(height: 16),
            buildPaymentTile('PayPal', Icons.account_balance_wallet, 1),
            SizedBox(height: 16),
            buildPaymentTile('Apple Pay', Icons.phone_iphone, 2),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentTile(String title, IconData icon, int value) {
    final mySelected = _selectedPaymentIndex == value;
    int selected = value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentIndex = selected;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: mySelected ? AppColors.heading : AppColors.card,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(16)),
            Icon(icon, size: 24, color: AppColors.heading),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 18, color: AppColors.grey),
            ),
            const Spacer(),
            Radio(
              fillColor: WidgetStateProperty.resolveWith<Color>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColors.heading.withValues(alpha: 0.32);
                }
                return AppColors.heading;
              }),
              value: value,
              groupValue: _selectedPaymentIndex,
              onChanged: (int? selected) {
                setState(() {
                  _selectedPaymentIndex = selected!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
