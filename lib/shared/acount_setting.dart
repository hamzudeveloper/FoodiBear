import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/03/eb/d6/03ebd625cc0b9d636256ecc44c0ea324.jpg',
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.borderPrimary,
                          width: 2,
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
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
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
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.card,
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
            SizedBox(height: 20),
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
