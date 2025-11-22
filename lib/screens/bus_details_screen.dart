import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/eta_tile.dart';
import '../widgets/map_view.dart';
import '../provider/bus_provider.dart';
import '../utils/colors.dart';
import '../models/bus_model.dart';

class BusDetailsScreen extends StatelessWidget {
  final String busId;

  const BusDetailsScreen({
    super.key,
    required this.busId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Details'),
        backgroundColor: AppColors.primaryNavy,
        foregroundColor: Colors.white,
      ),
      body: Consumer<BusProvider>(
        builder: (context, busProvider, child) {
          final bus = busProvider.getBusById(busId);
          
          if (bus == null) {
            return const Center(child: Text('Bus not found'));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 300,
                  child: MapView(
                    buses: [bus],
                    showSingleBus: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bus ${bus.routeNumber}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryNavy,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Route: ${bus.routeName}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Estimated Arrival',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ETATile(
                        eta: bus.eta,
                        nextStop: bus.nextStop,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Route Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // TODO: Display route stops
                      Text(
                        'Stops: ${bus.routeStops?.join(', ') ?? 'N/A'}',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

