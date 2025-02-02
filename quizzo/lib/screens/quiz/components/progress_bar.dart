import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzo/constants.dart';
import 'package:quizzo/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF3F4768),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: GetBuilder<QuestionController>(
            init: QuestionController(),
            builder: (controller) {
              print(controller.animation.value);
              return Stack(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Container(
                      //from 0 to 1 it takes 60s
                      width: constraints.maxWidth * controller.animation.value, 
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${(controller.animation.value * 60).round()} sec"),
                          WebsafeSvg.asset("assets/icons/clock.svg"),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        )
      ],
    );
  }
}
