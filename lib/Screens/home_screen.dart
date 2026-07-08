import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';
import 'package:foodi_bear/Screens/category_screen.dart';
import 'package:foodi_bear/Screens/notification_screen.dart';
import 'package:foodi_bear/Screens/popularMenu_screen.dart';
import 'package:foodi_bear/shared/cuisines_cards.dart';
import 'package:foodi_bear/shared/custom_navbar.dart';
import 'package:foodi_bear/shared/home_banner.dart';
import 'package:foodi_bear/shared/recommended_card.dart';
import 'package:foodi_bear/shared/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> foods = [
      FoodModel(
        id: "1",
        image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
        category: "Main Course",
        title: "Nova Truffle Burger",
        description:
            "A5 Wagyu, Black Truffle Emulsion, and aged Fontina on a gilded brioche bun.",
        rating: 4.8,
        buttonText: "ADD TO CART",
        price: "\$20",
      ),

      FoodModel(
        id: "2",
        image: "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",
        category: "Restaurant",
        title: "The Gilded Fork",
        description:
            "Classical European techniques meeting avant-garde presentation styles.",
        rating: 5.0,
        buttonText: "START ORDERING",
        price: "\$20",
      ),

      FoodModel(
        id: "3",
        image: "https://images.unsplash.com/photo-1490645935967-10de6ba17061",
        category: "Breakfast",
        title: "Nebula Bowl",
        description:
            "Superfood blend of dragon fruit, açaí, and Martian honey granola.",
        rating: 4.7,
        buttonText: "ADD TO CART • \$18",
        price: "\$20",
      ),

      FoodModel(
        id: "4",
        image: "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
        category: "Healthy",
        title: "Green Galaxy Salad",
        description:
            "Fresh avocado, quinoa, kale, roasted almonds, and citrus vinaigrette.",
        rating: 4.9,
        buttonText: "ADD TO CART • \$22",
        price: "\$20",
      ),

      FoodModel(
        id: "5",
        image: "https://images.unsplash.com/photo-1555939594-58d7cb561ad1",
        category: "Steak",
        title: "Prime Rib Royale",
        description:
            "Dry-aged ribeye served with garlic butter, asparagus, and mashed potatoes.",
        rating: 4.9,
        buttonText: "ADD TO CART • \$56",
        price: "\$20",
      ),

      FoodModel(
        id: "6",
        image: "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe",
        category: "Dessert",
        title: "Golden Cheesecake",
        description:
            "Creamy vanilla cheesecake topped with caramel glaze and fresh berries.",
        rating: 4.6,
        buttonText: "ADD TO CART • \$14",
        price: "\$20",
      ),

      FoodModel(
        id: "7",
        image: "https://images.unsplash.com/photo-1504674900247-0877df9cc836",
        category: "Seafood",
        title: "Ocean Pearl Platter",
        description:
            "Grilled salmon, butter prawns, calamari, and seasonal vegetables.",
        rating: 4.8,
        buttonText: "ADD TO CART • \$48",
        price: "\$20",
      ),

      FoodModel(
        id: "8",
        image: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
        category: "Pizza",
        title: "Inferno Supreme",
        description:
            "Wood-fired pizza with pepperoni, jalapeños, mozzarella, and basil.",
        rating: 4.7,
        buttonText: "ADD TO CART • \$28",
        price: "\$20",
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: AppColors.background,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/foodi_bear_logo.png"),
          ),
        ),
        title: Text(
          "Foodi Bear",
          style: TextStyle(
            color: AppColors.heading,
            fontSize: AppSizes.textXLarge,
          ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.notifications_outlined),
                color: AppColors.heading,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.heading,
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Hello Hamzu",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "What are you craving today?",
                  style: TextStyle(color: AppColors.heading, fontSize: 20),
                ),

                SizedBox(height: 15),
                // FunctionalSearchScreen(),
                TextField(
                  style: TextStyle(
                    color: AppColors.white,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.card,
                    prefixIcon: Icon(Icons.search, color: AppColors.heading),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: AppColors.heading,
                      ),
                    ),

                    contentPadding: EdgeInsets.all(10),

                    hint: Text(
                      "Search resturants, food, drinks...",
                      style: TextStyle(color: const Color(0xFF4D4543)),
                    ),
                  ),
                ),
                AppSizes.h24,

                HomeBanner(),

                AppSizes.h20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore Cuisines",
                      style: TextStyle(color: AppColors.white, fontSize: 24),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
                  ],
                ),

                AppSizes.h16,

                Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: CategoryCard(
                          title: "Deals",
                          image: "assets/deal1.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  burgers: [
                                    {
                                      "name": "Classic Burger",
                                      "price": 8.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
                                    },
                                    {
                                      "name": "Cheese Burger",
                                      "price": 9.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    },
                                    {
                                      "name": "Double Beef Burger",
                                      "price": 12.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500",
                                    },
                                    {
                                      "name": "Chicken Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500",
                                    },
                                    {
                                      "name": "Crispy Chicken Burger",
                                      "price": 10.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1610614819513-58e34989848b?w=500",
                                    },
                                    {
                                      "name": "BBQ Burger",
                                      "price": 11.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500",
                                    },
                                    {
                                      "name": "Bacon Burger",
                                      "price": 12.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500",
                                    },
                                    {
                                      "name": "Veggie Burger",
                                      "price": 8.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500",
                                    },
                                    {
                                      "name": "Mushroom Burger",
                                      "price": 10.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500",
                                    },
                                    {
                                      "name": "Spicy Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1550317138-10000687a72b?w=500",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CategoryCard(
                          title: "Pizza",
                          image: "assets/pizza.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  burgers: [
                                    {
                                      "name": "Classic Burger",
                                      "price": 8.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
                                    },
                                    {
                                      "name": "Cheese Burger",
                                      "price": 9.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    },
                                    {
                                      "name": "Double Beef Burger",
                                      "price": 12.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500",
                                    },
                                    {
                                      "name": "Chicken Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500",
                                    },
                                    {
                                      "name": "Crispy Chicken Burger",
                                      "price": 10.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1610614819513-58e34989848b?w=500",
                                    },
                                    {
                                      "name": "BBQ Burger",
                                      "price": 11.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500",
                                    },
                                    {
                                      "name": "Bacon Burger",
                                      "price": 12.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500",
                                    },
                                    {
                                      "name": "Veggie Burger",
                                      "price": 8.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500",
                                    },
                                    {
                                      "name": "Mushroom Burger",
                                      "price": 10.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500",
                                    },
                                    {
                                      "name": "Spicy Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1550317138-10000687a72b?w=500",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AppSizes.h20,
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: CategoryCard(
                          title: "Chicken Pieces",
                          image: "assets/piece.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  burgers: [
                                    {
                                      "name": "Classic Burger",
                                      "price": 8.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
                                    },
                                    {
                                      "name": "Cheese Burger",
                                      "price": 9.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    },
                                    {
                                      "name": "Double Beef Burger",
                                      "price": 12.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500",
                                    },
                                    {
                                      "name": "Chicken Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500",
                                    },
                                    {
                                      "name": "Crispy Chicken Burger",
                                      "price": 10.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1610614819513-58e34989848b?w=500",
                                    },
                                    {
                                      "name": "BBQ Burger",
                                      "price": 11.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500",
                                    },
                                    {
                                      "name": "Bacon Burger",
                                      "price": 12.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500",
                                    },
                                    {
                                      "name": "Veggie Burger",
                                      "price": 8.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500",
                                    },
                                    {
                                      "name": "Mushroom Burger",
                                      "price": 10.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500",
                                    },
                                    {
                                      "name": "Spicy Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1550317138-10000687a72b?w=500",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CategoryCard(
                          title: "Fries",
                          image: "assets/fries.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  burgers: [
                                    {
                                      "name": "Classic Burger",
                                      "price": 8.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
                                    },
                                    {
                                      "name": "Cheese Burger",
                                      "price": 9.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    },
                                    {
                                      "name": "Double Beef Burger",
                                      "price": 12.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500",
                                    },
                                    {
                                      "name": "Chicken Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500",
                                    },
                                    {
                                      "name": "Crispy Chicken Burger",
                                      "price": 10.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1610614819513-58e34989848b?w=500",
                                    },
                                    {
                                      "name": "BBQ Burger",
                                      "price": 11.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500",
                                    },
                                    {
                                      "name": "Bacon Burger",
                                      "price": 12.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500",
                                    },
                                    {
                                      "name": "Veggie Burger",
                                      "price": 8.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500",
                                    },
                                    {
                                      "name": "Mushroom Burger",
                                      "price": 10.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500",
                                    },
                                    {
                                      "name": "Spicy Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1550317138-10000687a72b?w=500",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CategoryCard(
                          title: "Burgers",
                          image: "assets/burger.png",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  burgers: [
                                    {
                                      "name": "Classic Burger",
                                      "price": 8.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
                                    },
                                    {
                                      "name": "Cheese Burger",
                                      "price": 9.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1609167830220-7164aa360951?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                    },
                                    {
                                      "name": "Double Beef Burger",
                                      "price": 12.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9?w=500",
                                    },
                                    {
                                      "name": "Chicken Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1606755962773-d324e0a13086?w=500",
                                    },
                                    {
                                      "name": "Crispy Chicken Burger",
                                      "price": 10.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1610614819513-58e34989848b?w=500",
                                    },
                                    {
                                      "name": "BBQ Burger",
                                      "price": 11.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1594212699903-ec8a3eca50f5?w=500",
                                    },
                                    {
                                      "name": "Bacon Burger",
                                      "price": 12.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1586190848861-99aa4a171e90?w=500",
                                    },
                                    {
                                      "name": "Veggie Burger",
                                      "price": 8.49,
                                      "image":
                                          "https://images.unsplash.com/photo-1520072959219-c595dc870360?w=500",
                                    },
                                    {
                                      "name": "Mushroom Burger",
                                      "price": 10.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=500",
                                    },
                                    {
                                      "name": "Spicy Burger",
                                      "price": 9.99,
                                      "image":
                                          "https://images.unsplash.com/photo-1550317138-10000687a72b?w=500",
                                    },
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                AppSizes.h16,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended For You",
                      style: TextStyle(color: AppColors.white, fontSize: 24),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward, color: AppColors.primary),
                    ),
                  ],
                ),
                AppSizes.h16,
                RecommendedCard(),

                // below this is just for testing
                AppSizes.h16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Near You",
                      style: TextStyle(color: AppColors.white, fontSize: 24),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward, color: AppColors.primary),
                    ),
                  ],
                ),
                AppSizes.h16,

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    return FoodCard(food: foods[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
