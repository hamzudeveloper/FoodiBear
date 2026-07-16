import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/Core/Constants/app_sizes.dart';
import 'package:foodi_bear/Screens/editProfile_screen.dart' hide AppColors;

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileBackground,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [AppColors.orange, AppColors.orangeLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/mine.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.cardBackground,
                          child: const Icon(
                            Icons.person,
                            size: 48,
                            color: AppColors.iconMuted,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hamzu',
                        style: TextStyle(
                          color: const Color(0xFF83ACB6),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'hamzu@example.com',
                        style: TextStyle(
                          color: const Color(0xFF83ACB6),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Member since \n jan  2023',
                        style: TextStyle(
                          color: const Color(0xFF83ACB6),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  AppSizes.h20,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.borderPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.h20,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFFF6B35).withValues(alpha: 0.2),
                        ),
                        child: Icon(
                          Icons.person_outline_sharp,
                          color: AppColors.primary,
                        ),
                      ),
                      title: Text(
                        'Personal Information',
                        style: TextStyle(color: const Color(0xFF83ACB6)),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFFF6B35).withValues(alpha: 0.2),
                        ),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: const Color(0xFFFF6B35),
                        ),
                      ),
                      title: Text(
                        'Saved Addresses',
                        style: TextStyle(color: const Color(0xFF83ACB6)),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFFF6B35).withValues(alpha: 0.2),
                        ),
                        child: Icon(
                          Icons.payment,
                          color: const Color(0xFFFF6B35),
                        ),
                      ),
                      title: Text(
                        'Payment Methods',
                        style: TextStyle(color: const Color(0xFF83ACB6)),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xFFFF6B35).withValues(alpha: 0.2),
                        ),
                        child: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: const Color(0xFFFF6B35),
                        ),
                      ),
                      title: Text(
                        'Bear Wallet Settings',
                        style: TextStyle(color: const Color(0xFF83ACB6)),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            AppSizes.h20,
            Text(
              "Foodi Bear version 1.0.0",
              style: TextStyle(color: const Color(0xFF5E4C46), fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Terms of Service",
                  style: TextStyle(color: AppColors.primary),
                ),
                SizedBox(width: 10),
                Text(
                  "Privacy Policy",
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "© 2023 Foodi Bear. All rights reserved.",
              style: TextStyle(color: const Color(0xFF5E4C46), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
