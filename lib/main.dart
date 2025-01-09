import 'package:flutter/material.dart';
import 'package:project_tracker/screens/login_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Attendance System',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
