import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding_screen.dart';
import 'provider/bus_provider.dart';
import 'provider/user_provider.dart';
import 'provider/location_provider.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BusProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        title: 'RUN - Bus Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: AppColors.primaryNavy,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryNavy,
            primary: AppColors.primaryNavy,
            secondary: AppColors.primaryTeal,
          ),
          useMaterial3: true,
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}

