import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // Listening to the slidingAnimation for changes
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          // Applying the slidingAnimation to the position of the widget
          position: slidingAnimation,
          child: const Text(
            'Schedule your appointments',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
