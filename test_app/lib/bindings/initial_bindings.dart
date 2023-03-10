import 'package:get/get.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/controllers/theme_controller.dart';
import 'package:test_app/services/firebase_storage_services.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
