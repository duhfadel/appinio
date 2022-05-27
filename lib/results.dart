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

  calcWidth() {
    counter++;
    if (widget.answer == answer1) {
      counterAnswer1++;
    } else {
      counterAnswer2++;
    }
    double testAnswer1 = ((100 / counterAnswer1) * counter);
    double testAnswer2 = (100 / counterAnswer2 * counter);
    widthAnswer1 = MediaQuery.of(context).size.width * testAnswer1;
    widthAnswer2 = MediaQuery.of(context).size.width * testAnswer2;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //calcWidth();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 120,
              ),
              ChartLine(
                title: answer1,
                rate: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              ChartLine(
                title: answer2,
                rate: 0.1,
              ),
              //Answer(answer: answer1, widthAnswer: widthAnswer1),
              //Answer(answer: answer2, widthAnswer: widthAnswer2),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartLine extends StatelessWidget {
  const ChartLine({Key? key, required this.rate, required this.title})
      : assert(rate > 0),
        assert(rate <= 1),
        super(key: key);

  final double rate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final lineWidget = constraints.maxWidth * rate;
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(minWidth: lineWidget),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, color: Colors.amber),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 60,
                width: lineWidget,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
/*
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
          child: Text(
            answer,
            style: const TextStyle(color: Color.fromARGB(255, 16, 100, 168)),
          ),
        ),
      ),
    );
  }
}

*/
