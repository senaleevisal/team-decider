import 'package:flutter/material.dart';
import 'package:student_mgt/AddMember.dart';
import 'package:student_mgt/HomePage.dart';

void main() {
  runApp(StudentManagement());
}

class StudentManagement extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage(),
    );
  }
}





