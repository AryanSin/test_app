import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:test_app/configs/themes/ui_parameters.dart';
import 'package:test_app/controllers/questions_paper/question_paper_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_app/screens/home/question_card.dart';
import 'package:test_app/widgets/content_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return ContentArea(
        addPadding: false,
        child: Obx(() => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                  model: _questionPaperController.allPapers[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPapers.length)));
  }
}
