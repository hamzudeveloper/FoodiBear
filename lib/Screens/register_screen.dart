import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';
import 'package:foodi_bear/Screens/home_screen.dart';
import 'package:foodi_bear/Screens/register_screen.dart';
import 'package:foodi_bear/shared/custom_navbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            // height: double.infinity,
            padding: EdgeInsets.all(10),
            // decoration: BoxDecoration(border: BoxBorder.all(width: 2), color: AppColors.borderPrimary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/foodi_bear_logo.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 60),
                Text(
                  "Join The Feast!",
                  style: TextStyle(
                    color: AppColors.heading,
                    fontSize: AppSizes.headingText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 05),
                Text(
                  "Experience Futuristic Food Delivery at\n                  Your Doorstep.",
                  style: TextStyle(
                    color: AppColors.heading,
                    fontSize: AppSizes.textLarge,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(color: const Color(0xFFEBCBBF)),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: AppColors.heading,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 89, 214),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: AppColors.heading,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hint: Text(
                              "Muhammad Hamza",
                              style: TextStyle(color: const Color(0xFF4D4543)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: TextStyle(color: const Color(0xFFEBCBBF)),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextField(
                          style: TextStyle(color: AppColors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: AppColors.heading,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 89, 214),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: AppColors.heading,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hint: Text(
                              "hamzu.dev@gmail.com",
                              style: TextStyle(color: const Color(0xFF4D4543)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(color: const Color(0xFFEBCBBF)),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextField(
                          obscureText: true,
                          style: TextStyle(color: AppColors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: AppColors.heading,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 89, 214),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: AppColors.heading,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hint: Text(
                              "********",
                              style: TextStyle(color: const Color(0xFF4D4543)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Confirm",
                              style: TextStyle(color: const Color(0xFFEBCBBF)),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextField(
                          obscureText: true,
                          style: TextStyle(color: AppColors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.verified_user_outlined,
                              color: AppColors.heading,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 0, 89, 214),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1.5,
                                color: AppColors.heading,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hint: Text(
                              "********",
                              style: TextStyle(color: const Color(0xFF4D4543)),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavbarPage(),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Acount Successfully Created"),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Create Account",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
