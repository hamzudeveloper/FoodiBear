import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';
import 'package:foodi_bear/Screens/home_screen.dart';
import 'package:foodi_bear/Screens/register_screen.dart';
import 'package:foodi_bear/shared/custom_navbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                //App Logo....
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/foodi_bear_logo.png"),
                ),
                SizedBox(height: 60),

                // Heading..
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    color: AppColors.heading,
                    fontSize: AppSizes.headingText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 05),

                //Tag Line..
                Text(
                  "Your favourite meals are just a paw-tap away.",
                  style: TextStyle(
                    color: AppColors.heading,
                    fontSize: AppSizes.textLarge,
                  ),
                ),
                SizedBox(height: 20),

                //Email Input Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: TextStyle(color: AppColors.heading),
                    ),
                  ],
                ),
                SizedBox(height: 5),

                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hint: Text(
                      "Enter your Email Address",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Password Input Field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(color: AppColors.heading),
                    ),
                    InkWell(
                      onTap: () {
                        _showForgotPasswordDialog(context);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: AppColors.secondary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    hint: Text(
                      "Enter your Passwrod",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavbarPage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, color: AppColors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                dividerWithText("OR"),
                Text(
                  "Continue with",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 102, 103, 105),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Icon(Icons.facebook, color: Colors.blue, size: 50),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Icon(Icons.apple_outlined, size: 50),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an acount?",
                      style: TextStyle(color: AppColors.heading),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: AppColors.borderPrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget dividerWithText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(text, style: TextStyle(color: Colors.grey.shade600)),
        ),
        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
      ],
    ),
  );
}

void _showForgotPasswordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFF161F30), // Matching your dark UI theme
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ), // Rounded top corners
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Crucial: Makes the sheet only as tall as its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your email address and we will send you a link to reset your password.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            // Email Input Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email',
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Action Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFE65100,
                  ), // Orange theme color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () =>
                    Navigator.pop(context), // Closes the bottom sheet
                child: const Text(
                  'Send Reset Link',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void _showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF161F30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Reset Password',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize
              .min, // Prevents the dialog from stretching full screen
          children: [
            const Text(
              'Enter your email to receive a password reset link.',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Closes the dialog
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE65100),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('Send'),
          ),
        ],
      );
    },
  );
}
