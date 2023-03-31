import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test_app/firebase_ref/references.dart';
import 'package:test_app/screens/login/login_screen.dart';
import 'package:test_app/utilities/AppLog.dart';
import 'package:test_app/widgets/dialogs/dialogue_widget.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
          accessToken: (_authAccount).accessToken,
          idToken: (_authAccount).idToken,
        );

        await _auth.signInWithCredential(_credential);
        await saveUser(account);
      }
    } on Exception catch (error) {
      AppLog.e(error.toString());
    }
  }

  saveUser(GoogleSignInAccount account) async {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogue(onTap: () {
        Get.back();
        NavigateToLoginPage();
      }),
      barrierDismissible: false,
    );
  }

  void NavigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
