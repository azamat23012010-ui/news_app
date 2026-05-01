import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoFoundScreen extends StatelessWidget {
  const NoFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset('assets/lotties/404.json',width: 250,height: 200,)
            ],
          ),
        ),
      ),
    );
  }
}