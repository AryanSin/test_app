import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/bindings/initial_bindings.dart';
import 'package:test_app/configs/themes/app_light_theme.dart';
import 'package:test_app/controllers/theme_controller.dart';
import 'package:test_app/routes/app_routes.dart';
import 'package:test_app/screens/introduction/introduction.dart';
import 'package:test_app/screens/splash/splash_screen.dart';
import 'configs/themes/app_dark_theme.dart';
import 'data_uploader_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(options: DefaultFirebaseOptions.web);
//   await Firebase.initializeApp();
//   runApp(GetMaterialApp(home: DataUploaderScreen()));
// }
