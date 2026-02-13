import 'package:flutter/material.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class DrawerHeaderSection extends StatelessWidget {
  const DrawerHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppTheme.of(context).warning,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Logo Icon
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  Icons.self_improvement,
                  color: Colors.amber.shade700,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Logo Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Moksha',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: 'Path',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.of(context).error,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Guided Path to True Learning',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
