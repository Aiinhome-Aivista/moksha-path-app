import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class DrawerContents extends StatelessWidget {
  const DrawerContents({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _buildDrawerItem(context, Icons.dashboard, 'Dashboard'),
        _buildDrawerItem(context, Icons.book, 'My Profile'),
        _buildDrawerItem(context, Icons.assignment, 'Learning Plan'),
        _buildDrawerItem(context, Icons.analytics, 'My Assessment'),
        _buildDrawerItem(context, Icons.calendar_today, 'Video Tutorials'),
        _buildDrawerItem(context, Icons.settings, 'My Subscription'),
        const Divider(),
        _buildDrawerItem(context, Icons.help_outline, 'Help & Support'),
      ],
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(
        title,
        style: TextStyle(color: AppTheme.of(context).textPrimary),
      ),
      onTap: () {},
    );
  }
}
