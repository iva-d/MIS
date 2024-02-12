import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mis_labs/auth_screen.dart';

import 'firebase_options.dart';
import 'home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Timetable App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set initial route to handle authentication
      routes: {
        '/': (context) => AuthenticationWrapper(), // Authentication wrapper to handle auth state
        '/home': (context) => HomeScreen(), // Home screen route
      },
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData && snapshot.data != null) {
            // User is authenticated
            return HomeScreen();
          } else {
            // User is not authenticated
            return AuthScreen();
          }
        }
      },
    );
  }
}

