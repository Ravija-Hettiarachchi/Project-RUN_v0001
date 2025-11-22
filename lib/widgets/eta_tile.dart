import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ETATile extends StatelessWidget {
  final String eta;
  final String? nextStop;

  const ETATile({
    super.key,
    required this.eta,
    this.nextStop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryTeal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primaryTeal,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.access_time,
            color: AppColors.primaryTeal,
            size: 32,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Estimated Arrival',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  eta,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryNavy,
                  ),
                ),
                if (nextStop != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Next Stop: $nextStop',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

