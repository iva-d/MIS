import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      print("Sign in error: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign in failed. Please check your credentials."),
      ));
    }
  }

  Future<void> _signUpWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      print("Sign up error: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sign up failed. Please try again later."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _password = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => _email = value.trim(),
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              onChanged: (value) => _password = value.trim(),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _signInWithEmailAndPassword(context, _email, _password),
              child: Text('Sign In'),
            ),
            ElevatedButton(
              onPressed: () => _signUpWithEmailAndPassword(context, _email, _password),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
