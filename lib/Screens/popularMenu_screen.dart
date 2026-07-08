import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/shared/card_data.dart';

class FoodModel {
  final String id;
  final String image;
  final String category;
  final String title;
  final String description;
  final double rating;
  final String buttonText;
  final String price;

  FoodModel({
    required this.image,
    required this.category,
    required this.title,
    required this.description,
    required this.rating,
    required this.buttonText,
    required this.id,
    required this.price,
  });
}

class FoodCard extends StatefulWidget {
  final FoodModel food;
  final bool isFavorite;

  const FoodCard({super.key, required this.food, this.isFavorite = false});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xff182338),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: Image.network(
                  widget.food.image,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                left: 16,
                bottom: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF8B26),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    widget.food.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text(
                            isFavorite
                                ? '${widget.food.title} removed from favorites!'
                                : '${widget.food.title} added to favorites!',
                          ),
                        ),
                      );
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.food.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const Icon(Icons.star, color: Colors.amber, size: 18),

                    const SizedBox(width: 4),

                    Text(
                      widget.food.rating.toString(),
                      style: const TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  widget.food.description,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    height: 1.5,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 22),

                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xffFF6A3D), Color(0xffFDB515)],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      CartData.addToCart(
                        id: widget.food.id,
                        title: widget.food.title,
                        price: double.parse(widget.food.price.replaceAll('\$', '')),
                        imageUrl: widget.food.image,
                        option: widget.food.description,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.food.title} added to cart!'),
                          backgroundColor: AppColors.background,
                          
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      widget.food.buttonText,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
