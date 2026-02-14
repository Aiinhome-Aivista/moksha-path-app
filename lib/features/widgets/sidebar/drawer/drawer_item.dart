// import 'package:flutter/material.dart';

// class DrawerItem extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final int index;
//   final bool isSelected;
//   final Function(int) onTap;

//   const DrawerItem({
//     required this.icon,
//     required this.title,
//     required this.index,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: () => onTap(index),
//           borderRadius: BorderRadius.circular(8),
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: isSelected ? Colors.blue.shade50 : Colors.transparent,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   icon,
//                   size: 22,
//                   color: isSelected
//                       ? Colors.blue.shade700
//                       : Colors.grey.shade600,
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: isSelected
//                           ? FontWeight.w600
//                           : FontWeight.w400,
//                       color: isSelected
//                           ? Colors.blue.shade700
//                           : Colors.grey.shade700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
