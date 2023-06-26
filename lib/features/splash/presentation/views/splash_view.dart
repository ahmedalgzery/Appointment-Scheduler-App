import 'package:appointment/features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

// This widget represents the splash view of the application.
// It displays the body content using the SplashViewBody widget.

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // Setting the body of the Scaffold to a SplashViewBody widget
      body: SplashViewBody(),
    );
  }
}
