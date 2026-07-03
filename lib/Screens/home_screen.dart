import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';
import 'package:foodi_bear/Screens/notification_screen.dart';
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
                  Icons.shopping_bag_outlined,
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
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CategoryCard(
                          title: "hotdog",
                          image: "assets/hot_dog.png",
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
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CategoryCard(
                          title: "Hot Wings",
                          image: "assets/wings.png",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CategoryCard(
                          title: "Burgers",
                          image: "assets/burger.png",
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
                Text('nothing'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
