/// [Ther Model Class]
class ValidationItem {
  // This class is the Model for the signUp validation.
  // NOTE: Everything that comes out of a TextField is a string.
  final String value;
  // the value will store the valid data that will be used to validate the validation items.
  final String error;
  // and if any error(does not satisfies the validation criteria) occurs then this
  // error message will pop up.

  // A constructor for mapping the variables to the class.
  ValidationItem(this.value, this.error);
}
