import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:student_mgt/AddMember.dart';
import 'package:student_mgt/Student.dart';
import 'package:student_mgt/TeamDivider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TeamDivider students = TeamDivider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 97, 186, 255),
      appBar: AppBar(
        title: Text('Group Viewer'),
        backgroundColor: Color.fromARGB(255, 8, 48, 80),
        centerTitle: true,
      ),
      body:LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  (students.studentList.length == 0 ? 0 : ((students.studentList.length ~/ 5)+1)) ,
                      (index) => Groups(members: students.getMembers(index+1),)
              ),
            ),
          ),
        );
      }),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
              child: FloatingActionButton(
                onPressed: () {
                  students.shuffleStudents();
                },
                child: Icon(Icons.shuffle),
                backgroundColor: Color.fromARGB(255, 7, 37, 59),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              heroTag: null, // or omit this line as it's null by default
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMember(students: students),
                  ),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Color.fromARGB(255, 7, 37, 59),
            ),
          ),
        ],
      ),
    );
  }
}

class Groups extends StatefulWidget {
  const Groups({required this.members});
  final List<Student> members;

  @override
  State<Groups> createState() => _GroupsState(members);
}

class _GroupsState extends State<Groups> {
  _GroupsState(this.members);
  final List<Student> members;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      child: Column(
        children: [
          ListTile(
            title: Text("Group A"),
            tileColor: Color.fromARGB(255, 195, 226, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
          ),
          Divider(),
          Column(
            children: members.map((member) => ListTile(title: Text(member.badge + " - " +member.name ))).toList(),
          ),
        ],
      ),
    );
  }
}
