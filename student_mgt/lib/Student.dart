class Student {
  String name = "";
  String badge = "";

  Student(String name, String badge) {
    this.name = name;
    this.badge = badge;
  }
  bool equals(Student student){
    return (this.name.compareTo(student.name) == 0  && this.badge.compareTo(student.badge) == 0)  ? true : false;
  }
}