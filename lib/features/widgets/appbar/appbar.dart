import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class MokshaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MokshaAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.of(context).background,
      elevation: 2,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: AppTheme.of(context).textPrimary),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.self_improvement,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Moksha',
                  style: TextStyle(
                    color: AppTheme.of(context).textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: 'Path',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: AppTheme.of(context).textPrimary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
