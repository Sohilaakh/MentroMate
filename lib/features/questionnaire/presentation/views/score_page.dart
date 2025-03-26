import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/widgets/custom_app_bar.dart';
import 'package:mentroverso/core/widgets/gradient_button.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/themes.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widget/questionnaire_view_body.dart';

class ScorePage extends StatelessWidget {
  final double score;
  final List<String> suggestedCourses;

  const ScorePage({super.key, required this.score, required this.suggestedCourses});



  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      LinearGradientBackGroundColor(
        beginColor: Alignment.bottomLeft,
        endColor: Alignment.topRight,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Score',
            onIconPressed: () {
              GoRouter.of(context).pop(AppRouter.kHome);
            },
          ),
          body: Container(
            width: double.infinity,
            height:  Constant.getHeight(context) * 0.35,
            margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color:  ColorResources.lightGray.withAlpha(64),
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Colors.white),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Score: $score %", style: Styles.textStyle20,),
                const SizedBox(height: 80),
                Row(
                  children: [
                    Container(
                      width: Constant.getWidth(context)*0.3,
                      height: Constant.getHeight(context)*0.05,
                      decoration: BoxDecoration(
                        gradient:  LinearGradient(
                          colors: [
                            ColorResources.darkMauve,
                            ColorResources.forestGreen,
                          ],
                          stops: [0.0,1.0],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:  [
                          BoxShadow(
                            color: ColorResources.darkGray,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: ElevatedButton(
                        onPressed:(){
                          context.push(AppRouter.kChatbotView, extra: suggestedCourses);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Suggest Courses",
                          style: Styles.textStyle13.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 35),
                    Container(
                      width: Constant.getWidth(context)*0.35,
                      height: Constant.getHeight(context)*0.05,
                      decoration: BoxDecoration(
                        gradient:  LinearGradient(
                          colors: [
                            ColorResources.darkMauve,
                            ColorResources.forestGreen,
                          ],
                          stops: [0.0,1.0],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow:  [
                          BoxShadow(
                            color: ColorResources.darkGray,
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),

                      child: ElevatedButton(
                        onPressed:(){
                          bool showCorrectAnswers = true;
                          context.push(AppRouter.kQuestionnaireView, extra: showCorrectAnswers);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "View Correct Answers",
                          style: Styles.textStyle13.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )),
    ]);
  }
}
