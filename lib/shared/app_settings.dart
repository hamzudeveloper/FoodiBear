import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                        Icons.notifications_none,
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text(
                      'Notifications',
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
                        Icons.shield_outlined,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    title: Text(
                      'Security & Privacy',
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
                        Icons.language_outlined,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    title: Text(
                      'Language',
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
                        Icons.help_outline,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    title: Text(
                      'Help & Support',
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
                        isDarkMode
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                        color: const Color(0xFFFF6B35),
                      ),
                    ),
                    title: Text(
                      isDarkMode ? 'Dark Mode' : 'Light Mode',
                      style: TextStyle(color: const Color(0xFF83ACB6)),
                    ),
                    trailing: Switch(
                      value: isDarkMode,
                      activeThumbColor: Colors.white,
                      activeTrackColor: Colors.deepOrange,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      trackOutlineColor: MaterialStateProperty.all(
                        Colors.deepOrange,
                      ),
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
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
                      child: Icon(Icons.logout, color: const Color(0xFFFF6B35)),
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: const Color(0xFF83ACB6)),
                    ),
                    onTap: () {},
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
