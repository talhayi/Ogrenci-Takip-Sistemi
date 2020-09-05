import 'package:first_project/models/Student.dart';
import 'package:first_project/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formkey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                buildFirtsNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            )),
      ),
    );
  }

  Widget buildFirtsNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Adi", hintText: "Adinizi Girin"),
      validator: validateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Öğrenci Soyadı", hintText: "Soyadinizi Girin"),
      validator: validateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Aldiği not",
          hintText: "0 ile 100 arasında değer giriniz"),
      validator: validateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        setState(() {
          if (formkey.currentState.validate()) {
            formkey.currentState.save();
            students.add(student);
            saveStudent();
            Navigator.pop(context);
          }
        });
      },
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
