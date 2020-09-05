class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student.withoutInfo();
  String get getFirstName => firstName;

  set setFirstName(String firstName) => this.firstName = firstName;

  String get getLastName => lastName;

  set setLastName(String lastName) => this.lastName = lastName;

  int get getGrade => grade;

  set setGrade(int grade) => this.grade = grade;

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Passed";
    } else if (this.grade >= 40) {
      message = "Resit exam";
    } else {
      message = "Failed";
    }
    return message;
  }
/*
  int get getId => id;

  set setId(int id) => this.id = id;*/
}
