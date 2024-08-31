import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

enum LottieAnimationsType {
  asset,
  network, /* ... add more types if needed */
}

class LottieAnimations extends StatelessWidget {
  const LottieAnimations({required this.type, required this.path, super.key});
  final LottieAnimationsType type;
  final String path;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      LottieAnimationsType.asset => Lottie.asset(path),
      LottieAnimationsType.network => Lottie.network(path),
    };
  }
}
