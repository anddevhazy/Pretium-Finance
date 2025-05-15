import 'package:flutter/material.dart';

Widget buildServiceItem({
  IconData? icon,
  Color? iconColor,
  required String label,
  required double itemWidth,
  String? imagePath,
}) {
  final double finalWidth = itemWidth < 70 ? 70 : itemWidth;

  return SizedBox(
    width: finalWidth,
    child: Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child:
                imagePath != null
                    ? Image.asset(
                      imagePath,
                      width: itemWidth * 0.4,
                      height: itemWidth * 0.4,
                    )
                    : Icon(icon, color: iconColor, size: itemWidth * 0.4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: finalWidth < 80 ? 12 : 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
