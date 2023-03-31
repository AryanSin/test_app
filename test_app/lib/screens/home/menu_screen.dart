import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/configs/themes/app_colors.dart';
import 'package:test_app/controllers/zoom_drawer_controller.dart';

class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(gradient: mainGradient()),
      width: double.maxFinite,
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style:
                    TextButton.styleFrom(foregroundColor: onSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toggleDrawer();
                  },
                ))
          ],
        )),
      ),
    );
  }
}
