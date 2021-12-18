import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {


  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key)
  ;



  final Question question;

  @override
  Widget build(BuildContext context) {
    stt.SpeechToText _speech;
    bool _isListening = false;
    String _text = 'Press the button and start speaking';
    double _confidence = 1.0;
    void initState() {

      _speech = stt.SpeechToText();
    }



    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kBlackColor),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),


            ),
          ),
        ],
      ),
    );
  }
}
