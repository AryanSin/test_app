import 'package:get/get.dart';
import 'package:test_app/firebase_ref/references.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      // print(5);
      return null;
    }
    try {
      // print(3);
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      // print(4);
      print(e);
      return null;
    }
  }
}
