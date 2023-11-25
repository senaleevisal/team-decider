import 'package:flutter/material.dart';
import 'package:student_mgt/Student.dart';
import 'package:student_mgt/TeamDivider.dart';
import 'package:student_mgt/main.dart';

class AddMember extends StatefulWidget {
  final TeamDivider students;


  const AddMember({required this.students});

  @override
  State<AddMember> createState() => _AddMemberState(students);
}

class _AddMemberState extends State<AddMember>  {
  final nameContoller = TextEditingController();
  final batchContoller = TextEditingController();
  late var students;
  _AddMemberState(TeamDivider students){
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Group Viewer'),
          backgroundColor: Color.fromARGB(255, 8, 48, 80),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: batchContoller,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter student batch',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 86),
                    child: TextFormField(
                      controller: nameContoller,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter student name',
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              students.studentList.contains(Student(nameContoller.text, batchContoller.text))
                                  ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Already added!"),
                                      content: const Text(
                                          "This name is already contains you can't add duplicates."),
                                      actions: <Widget>[
                                        TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'))
                                      ],
                                    );
                                  })
                                  : students.addStudent(nameContoller.text,batchContoller.text);
                              nameContoller.clear();
                              batchContoller.clear();
                            });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 3, 107, 25),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontSize: 20)),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text('Add'),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 124, 10, 10),
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(fontSize: 20)),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text('close'),
                          )),
                    ),
                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
