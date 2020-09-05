class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "Adınız en az iki karekter olmalıdır";
    }
    return null;
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyadnız en az iki karekter olmalıdır";
    }
    return null;
  }

  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0 ile 100 arasında olmalıdır";
    }
    return null;
  }
}
