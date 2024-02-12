import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'exam_grid_view_widget.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Timetable'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add_exam');
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: ExamGridView(),
    );
  }
}
