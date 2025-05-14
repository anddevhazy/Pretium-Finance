import 'package:flutter/material.dart';

Widget buildNavBarItem({
  required IconData icon,
  required String label,
  required bool isSelected,
  bool isCenter = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child:
        isCenter
            ? Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF0E6557),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF0E6557).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 28,
              ),
            )
            : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: isSelected ? const Color(0xFF0E6557) : Colors.grey,
                  size: 28,
                ),
                if (label.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? const Color(0xFF0E6557) : Colors.grey,
                    ),
                  ),
                ],
              ],
            ),
  );
}
