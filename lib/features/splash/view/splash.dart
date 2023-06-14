import 'package:flutter/material.dart';
import 'package:grab_clone/utils/constants.dart';
import 'package:grab_clone/widgets/app_icon.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, this.nextPath = '', this.logo = Assets.logo});

  final String nextPath;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      onEnd: () => navigate(context),
      child: const Center(child: AppIconWidget(image: Assets.logo)),
    );
  }

  navigate(context) async {
    if (nextPath.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed(nextPath);
    }
  }
}
