import 'package:flutter/material.dart';
import 'models/exam.dart'; // Import the Exam model

class ExamGridView extends StatefulWidget {
  @override
  _ExamGridViewState createState() => _ExamGridViewState();
}

class _ExamGridViewState extends State<ExamGridView> {
  List<Exam> exams = []; // List to hold exam data

  @override
  void initState() {
    super.initState();
    // Initialize exam data (you can fetch it from a local database if needed)
    exams = [
      Exam(subject: 'Math', dateTime: DateTime(2024, 2, 15, 9, 0)),
      Exam(subject: 'Science', dateTime: DateTime(2024, 2, 16, 10, 30)),
      Exam(subject: 'History', dateTime: DateTime(2024, 2, 17, 13, 0)),
      // Add more exams as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: exams.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  exams[index].subject,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  '${exams[index].dateTime.toString()}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
