import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  const Results({Key? key, required this.answer}) : super(key: key);
  final String answer;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String question =
      'Should Appinio hires Eduardo Fadel Picheth as Flutter Junior?';

  String answer1 = 'Yes';
  String answer2 = 'No';
  int counter = 0;
  int counterAnswer1 = 0;
  int counterAnswer2 = 0;
  double widthAnswer1 = 1;
  double widthAnswer2 = 1;

  void calcWidth() {
    if (widget.answer == answer1) {
      counter++;
      counterAnswer1++;
    } else {
      counter++;
      counterAnswer2++;
    }
    double testAnswer1 = (100 / counterAnswer1 * counter);
    double testAnswer2 = (100 / counterAnswer2 * counter);
    widthAnswer1 = MediaQuery.of(context).size.width * testAnswer1;
    widthAnswer2 = MediaQuery.of(context).size.width * testAnswer2;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calcWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 4, 86, 153),
            Color.fromARGB(255, 115, 192, 228)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                question,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Answer(answer: answer1, widthAnswer: widthAnswer1),
              Answer(answer: answer2, widthAnswer: widthAnswer2),
            ],
          ),
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.answer, required this.widthAnswer})
      : super(key: key);

  final String answer;
  final double widthAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 100,
        width: widthAnswer,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: (() {}),
            child: Text(
              answer,
              style: const TextStyle(color: Color.fromARGB(255, 16, 100, 168)),
            ),
          ),
        ),
      ),
    );
  }
}
