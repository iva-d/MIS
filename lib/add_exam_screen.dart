import 'package:flutter/material.dart';
import 'models/exam.dart';

class AddExamScreen extends StatefulWidget {
  final Function(Exam) onExamAdded;

  AddExamScreen({required this.onExamAdded});

  @override
  _AddExamScreenState createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  String examName = '';
  DateTime examDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Exam'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) => examName = value.trim(),
            decoration: InputDecoration(
              hintText: 'Exam Name',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Exam newExam = Exam(subject: examName, dateTime: examDateTime);
              widget.onExamAdded(newExam);
              Navigator.pop(context);
            },
            child: Text('Add Exam'),
          ),
        ],
      ),
    );
  }
}
