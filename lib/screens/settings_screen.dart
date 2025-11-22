import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: AppColors.primaryNavy,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications, color: AppColors.primaryTeal),
            title: const Text('Notifications'),
            subtitle: const Text('Manage notification preferences'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to notification settings
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: AppColors.primaryTeal),
            title: const Text('Location Services'),
            subtitle: const Text('Location permissions and settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to location settings
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode, color: AppColors.primaryTeal),
            title: const Text('Theme'),
            subtitle: const Text('Light / Dark mode'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to theme settings
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: AppColors.primaryTeal),
            title: const Text('About'),
            subtitle: const Text('App version and information'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
        ],
      ),
    );
  }
}

