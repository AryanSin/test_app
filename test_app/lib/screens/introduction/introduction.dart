import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_app/configs/themes/app_colors.dart';
import 'package:test_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});
  static const String routeName = '/introduction';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, size: 65),
            const SizedBox(height: 40),
            const Text(
              "This is a study app. You can use it as you want. If you understand how this works, you would be able to scale it. With this you will master firebase backend and flutter front end.\n",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: onSurfaceTextColor),
            ),
            AppCircleButton(
                onTap: () => Get.offAndToNamed("/home"),
                child: const Icon(Icons.arrow_forward, size: 35))
          ],
        ),
      ),
    ));
  }
}
