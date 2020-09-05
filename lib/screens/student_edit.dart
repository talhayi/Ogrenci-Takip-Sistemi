import 'package:first_project/models/Student.dart';
import 'package:first_project/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  Student selectedStudent;

  var formkey = GlobalKey<FormState>();

  _StudentEditState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
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
      initialValue: selectedStudent.firstName,
      decoration:
          InputDecoration(labelText: "Öğrenci Adi", hintText: "Adinizi Girin"),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
          labelText: "Öğrenci Soyadı", hintText: "Soyadinizi Girin"),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(
          labelText: "Aldiği not",
          hintText: "0 ile 100 arasında değer giriniz"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
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

            saveStudent();
            Navigator.pop(context);
          }
        });
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
