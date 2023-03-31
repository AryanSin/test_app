import 'package:get/get.dart';
import 'package:test_app/controllers/questions_paper/question_paper_controller.dart';
import 'package:test_app/controllers/zoom_drawer_controller.dart';
import 'package:test_app/screens/home/home_screen.dart';
import 'package:test_app/screens/introduction/introduction.dart';
import 'package:test_app/screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
      ];
}
