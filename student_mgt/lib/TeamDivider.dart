import 'dart:math';

import 'package:student_mgt/Student.dart';

class TeamDivider{
  List<Student> studentList = [];

  void addStudent(String name , String badge){
    studentList.add(Student(name, badge));
  }

  void shuffleStudents(){
    final random = Random();
    studentList.shuffle(random);
  }

  bool contains(Student student){
    for (var value in studentList) {
       if(value.equals(student)){
         return true;
       }
    }
    return false;
  }

  List<Student> getMembers(int teamNumber) {
    int groupSize = 5;
    int startIndex = (teamNumber - 1) * groupSize;
    int endIndex = startIndex + groupSize;

    if (studentList.length % groupSize <= 3) {
      // If there are 3 or fewer remaining students, distribute them among existing groups
      startIndex = (teamNumber - 1) * (groupSize + 1);
      endIndex = startIndex + groupSize + 1;
    }

    // Ensure endIndex doesn't go beyond the length of the studentList
    endIndex = endIndex.clamp(0, studentList.length);

    return studentList.sublist(startIndex, endIndex);

  }


}