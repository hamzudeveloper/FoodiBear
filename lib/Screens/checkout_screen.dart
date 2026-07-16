import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  final price;
  const CheckoutScreen({super.key, required this.price});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedPaymentIndex = 1;
  bool isSelected = false;
  double deliveryCharges = 2.00;

  double get itemPrice {
    if (widget.price is String) {
      return double.tryParse(
            (widget.price as String).replaceAll(RegExp(r'[^\d.]'), ''),
          ) ??
          0.0;
    }
    return widget.price as double;
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = itemPrice + deliveryCharges;
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
            SizedBox(height: 20),
            buildPaymentTile('Credit Card', Icons.credit_card, 0),
            SizedBox(height: 16),
            buildPaymentTile('PayPal', Icons.account_balance_wallet, 1),
            SizedBox(height: 16),
            buildPaymentTile('Apple Pay', Icons.phone_iphone, 2),
            SizedBox(height: 16),
            buildPaymentTile('Bank Payment', Icons.wallet_rounded, 3),
            SizedBox(height: 16),
            buildPaymentTile('Andriod Pay', Icons.android_outlined, 4),

            SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: AppColors.card,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Item Total",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.heading,
                          ),
                        ),

                        Text(
                          "\$${itemPrice.toStringAsFixed(2)}",
                          style: TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.heading,
                          ),
                        ),

                        Text(
                          "\$${deliveryCharges.toStringAsFixed(2)}",
                          style: TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(color: AppColors.grey, thickness: 0.2),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                color: AppColors.heading,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "\$${totalAmount.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: AppColors.heading,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Card(
                          elevation: 8,
                          shadowColor: AppColors.borderPrimary.withValues(
                            alpha: .8,
                          ),
                          color: AppColors.heading,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
                            child: Text(
                              "Pay Now",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
