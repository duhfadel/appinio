import 'results.dart';
import 'package:appinio/results.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String question =
      'Should Appinio hires Eduardo Fadel Picheth as Flutter Junior?';
  String answer1 = 'Yes';
  String answer2 = 'No';

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
              const SizedBox(
                height: 120,
              ),
              Answer(answer: answer1),
              Answer(answer: answer2),
            ],
          ),
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  const Answer({
    Key? key,
    required this.answer,
  }) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => Results(answer: answer)),
                ),
              );
            },
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
