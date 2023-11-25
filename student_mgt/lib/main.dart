import 'package:flutter/material.dart';
import 'package:student_mgt/AddMember.dart';
import 'package:student_mgt/HomePage.dart';
import 'package:student_mgt/Teams.dart';

void main() {
  runApp(StudentManagement());
}

class StudentManagement extends StatefulWidget {
  const StudentManagement({super.key});

  @override
  State<StudentManagement> createState() => _StudentManagementState();
}

class _StudentManagementState extends State<StudentManagement> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}







