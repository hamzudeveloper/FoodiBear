import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = [
      {
        "title": "40 % OFF",
        "subtitle": "On your First order",
        "image": "assets/deal.png",
      },
      {
        "title": "40 % OFF",
        "subtitle": "On your First order",
        "image": "assets/deal.png",
      },
      {
        "title": "40 % OFF",
        "subtitle": "On your First order",
        "image": "assets/burger.png",
      },
      {
        "title": "40 % OFF",
        "subtitle": "On your First order",
        "image": "assets/deal1.png",
      },
    ];

    return CarouselSlider.builder(
      itemCount: banners.length,

      options: CarouselOptions(
        height: 190,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
      ),

      itemBuilder: (context, index, realindex) {
        final banner = banners[index];

        return Container(
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),

            image: DecorationImage(
              image: AssetImage(banner["image"]!),
              fit: BoxFit.cover,
            ),
          ),

          child: Container(
            padding: EdgeInsets.all(16),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.7),
                  Colors.black.withValues(alpha: 0.2),
                ],

                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  banner["title"]!,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppSizes.textXLarge,
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  banner["subtitle"]!,
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
