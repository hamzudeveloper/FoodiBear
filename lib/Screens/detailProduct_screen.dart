import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Screens/Wishlist_screen.dart';
import 'package:foodi_bear/services/cart_services.dart';
import 'package:foodi_bear/shared/card_data.dart';

class FoodDetailScreen extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final String price;
  const FoodDetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantity = 1;
  bool isFavorite = false;
  late double unitPrice;
  late double totalPrice;

  @override
  void initState() {
    super.initState();
    // widget.price looks like "$18.50" -> strip the $ and parse
    unitPrice = double.parse(widget.price.replaceAll('\$', ''));
    totalPrice = unitPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff07152B),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Image Section
              Stack(
                children: [
                  Image.asset(
                    widget.image,
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),

                  Positioned(
                    top: 20,
                    left: 20,

                    child: CircleAvatar(
                      backgroundColor: Colors.black54,

                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),

                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    right: 20,

                    child: CircleAvatar(
                      backgroundColor: Colors.black54,

                      child: IconButton(
                        onPressed: () {
                          FavouriteCard.addToCart(
                            id: widget.id,
                            title: widget.title,
                            price: double.parse(
                              widget.price.replaceAll('\$', ''),
                            ),
                            imageUrl: widget.image,
                            option: "This is Discription",
                          );
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon:
                         Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.all(25),

                decoration: BoxDecoration(
                  color: Color(0xff101E38),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                // Parent Column for all content below the image
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title + Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text(
                      "A rich and creamy pasta made with real truffle oil, parmesan cheese and a touch of garlic. Perfect for a cozy and delicious meal.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: 25),

                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff1C3158),
                            borderRadius: BorderRadius.circular(30),
                          ),

                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity--;
                                      totalPrice = unitPrice * quantity;
                                    });
                                  }
                                },
                                icon: Icon(Icons.remove, color: Colors.white),
                              ),

                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                    totalPrice = unitPrice * quantity;
                                  });
                                },
                                icon: Icon(Icons.add, color: Colors.white),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20),

                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),

                            onPressed: () {
                              CartData.addToCart(
                                id: widget.id,
                                title: widget.title,
                                price: unitPrice,
                                imageUrl: widget.image,
                                option: "Some data according to the product",
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(" Item added to cart")),
                              );
                            },

                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),

                    Text("Ingredients", style: titleStyle()),

                    SizedBox(height: 10),

                    Wrap(
                      children: [
                        ingredient("Spaghetti"),
                        SizedBox(width: 4),
                        ingredient("Truffle Oil"),
                        SizedBox(width: 4),
                        ingredient("Heavy Cream"),
                        SizedBox(width: 4),
                        ingredient("Parmesan Cheese"),
                        SizedBox(width: 4),
                        ingredient("Garlic"),
                        SizedBox(width: 4),
                        ingredient("Black Pepper"),
                      ],
                    ),

                    SizedBox(height: 25),

                    Text("Nutrition", style: titleStyle()),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        box("🔥", "520", "Calories"),
                        box("🌿", "18g", "   Fat  "),
                        box("🌾", "55g", "  Carbs "),
                        box("💪", "12g", " Protein"),
                      ],
                    ),

                    SizedBox(height: 30),

                    Text("About", style: titleStyle()),

                    SizedBox(height: 10),

                    Text(
                      "Our Truffle Cream Pasta is crafted with the finest ingredients to bring you a luxurious and satisfying experience in every bite.",

                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ingredient(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        "• $text",
        style: TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    );
  }

  Widget box(String icon, String value, String name) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Column(
        children: [
          Text(icon),

          SizedBox(height: 5),

          Text(
            value,

            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          Text(name, style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}
