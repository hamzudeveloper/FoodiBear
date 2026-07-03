import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';
import 'package:foodi_bear/shared/acount_setting.dart';
import 'package:foodi_bear/shared/app_settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Settings',
            style: TextStyle(color: AppColors.white, fontSize: 20),
          ),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.white,
            indicatorColor: AppColors.primary,
            dividerColor: Color.fromARGB(255, 21, 22, 24),
            tabs: [
              Tab(text: 'Account'),
              Tab(text: 'App'),
            ],
          ),
        ),
        body: const TabBarView(children: [AccountSetting(), AppSettings()]),
      ),
    );
  }
}
