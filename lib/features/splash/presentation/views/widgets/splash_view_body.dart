import 'package:appointment/core/utils/assets.dart';
import 'package:appointment/core/utils/service.dart';
import 'package:appointment/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:appointment/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

// This widget represents the body of the splash view.
// It displays the app logo image and a sliding text widget.

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    // Fetching data from Firestore
    FirebaseService().fetchDataFromFirestore();

    // Initializing the sliding animation
    initSlidingAnimation();

    // Navigating to the home view after a delay
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    // Disposing the animation controller
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Displaying the app logo image
        Image.asset(AssetesData.logo),
        const SizedBox(
          height: 4,
        ),

        // Displaying the sliding text widget with the sliding animation
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  // Initializing the sliding animation
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  // Navigating to the home view after a delay
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardView(),
        ),
      );
    });
  }
}
