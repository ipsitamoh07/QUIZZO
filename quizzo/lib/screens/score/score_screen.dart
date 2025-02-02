import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/constants.dart';
import 'package:quizzo/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController(),);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3,),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: kSecondaryColor,
                      fontSize: 35.5,
                    ),
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3,)
            ],
          )
        ],
      ),
    );
  }
}
