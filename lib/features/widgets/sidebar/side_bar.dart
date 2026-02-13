import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moksha_path/features/widgets/sidebar/drawer/drawer_contents.dart';
import 'package:moksha_path/features/widgets/sidebar/drawer/drawer_header.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.of(context).background,
      child: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: const Color.fromARGB(255, 132, 48, 48),
            displayColor: AppTheme.of(context).textPrimary,
          ),
        ),
        child: Column(
          children: [
            DrawerHeaderSection(),
            Expanded(child: DrawerContents()),
            const _SignOutButton(),
          ],
        ),
      ),
    );
  }
}

/// ---------------- HEADER ----------------

/// ---------------- DRAWER ITEM ----------------

/// ---------------- SIGN OUT BUTTON ----------------
class _SignOutButton extends StatelessWidget {
  const _SignOutButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle sign out
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Sign Out"),
                content: const Text("Are you sure you want to sign out?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context); // Close drawer
                      // Add sign out logic here
                    },
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Icon(Icons.logout, size: 22, color: Colors.grey.shade600),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Sign-out',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
