import 'package:flutter/material.dart';
import 'package:moksha_path/features/widgets/sidebar/drawer/drawer_item.dart';

class DrawerContents extends StatefulWidget {
  const DrawerContents({super.key});

  @override
  State<DrawerContents> createState() => _DrawerContentsState();
}

class _DrawerContentsState extends State<DrawerContents> {
    int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigator.pop(context); // closes drawer
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItem(
                    icon: Icons.home_outlined,
                    title: "Home",
                    index: 0,
                    isSelected: _selectedIndex == 0,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.person_outline,
                    title: "My Profile",
                    index: 1,
                    isSelected: _selectedIndex == 1,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.dashboard_outlined,
                    title: "My Dashboard",
                    index: 2,
                    isSelected: _selectedIndex == 2,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.assignment_outlined,
                    title: "My Learning Plan",
                    index: 3,
                    isSelected: _selectedIndex == 3,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.assignment_turned_in_outlined,
                    title: "My Assessments",
                    index: 4,
                    isSelected: _selectedIndex == 4,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.video_library_outlined,
                    title: "Video Tutorials",
                    index: 5,
                    isSelected: _selectedIndex == 5,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.quiz_outlined,
                    title: "My Tests",
                    index: 6,
                    isSelected: _selectedIndex == 6,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.note_outlined,
                    title: "Notes",
                    index: 7,
                    isSelected: _selectedIndex == 7,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.credit_card_outlined,
                    title: "My Subscription",
                    index: 8,
                    isSelected: _selectedIndex == 8,
                    onTap: _onItemTapped,
                  ),
                  DrawerItem(
                    icon: Icons.card_giftcard_outlined,
                    title: "Referral",
                    index: 9,
                    isSelected: _selectedIndex == 9,
                    onTap: _onItemTapped,

                    
                  ),
                ],
              )
            ;
  }
}