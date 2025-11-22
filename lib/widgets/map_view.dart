import 'package:flutter/material.dart';
import '../models/bus_model.dart';
import '../utils/colors.dart';

class MapView extends StatelessWidget {
  final List<Bus> buses;
  final bool showSingleBus;

  const MapView({
    super.key,
    required this.buses,
    this.showSingleBus = false,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Integrate with Google Maps Flutter
    // For now, showing a placeholder
    return Container(
      color: Colors.grey[300],
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  size: 64,
                  color: Colors.grey[600],
                ),
                const SizedBox(height: 16),
                Text(
                  'Map View',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${buses.length} bus(es) on map',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // Bus markers would be displayed here
          ...buses.map((bus) => Positioned(
                left: 50.0 + (buses.indexOf(bus) * 30.0),
                top: 100.0 + (buses.indexOf(bus) * 30.0),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primaryTeal,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.directions_bus,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

