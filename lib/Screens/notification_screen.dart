import 'package:flutter/material.dart';
import 'package:foodi_bear/Core/Constants/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('No notifications to display')),
    );
  }
}
