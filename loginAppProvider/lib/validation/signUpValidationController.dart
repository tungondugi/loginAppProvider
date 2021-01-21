/// [The Controller Class]
// This is the controller file, it is the backend code for the formValidation.
// The class here will be mixed with a mixin called the ChangeNotifier widget
// which allows us to listen to the changes that has been made in the widget tree.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginAppProvider/validation/signUpValidationModel.dart';

class SignUpController with ChangeNotifier {
  // These are all private variables.
  ValidationItem _fullName = ValidationItem(null, null);
  ValidationItem _dob = ValidationItem(null, null);

  /// [Getters]
  ValidationItem get fullName => _fullName;
  ValidationItem get dob => _dob;

  /// [getter for the submit button]
  bool get isValid {
    if (_fullName.value != null && _dob != null) {
      return true;
    } else {
      return false;
    }
  }

  /// [Setters]
  void changeFullName(String value) {
    // setter logic for the firstname
    if (value.length >= 3) {
      _fullName = ValidationItem(value, null);
    } else {
      _fullName = ValidationItem(null, "Must be atleast 3 characters");
    }
    // notifying all the listners.
    notifyListeners();
  }

  /// [For the DOB]
  ///
  /// [TextEditingController] -> This will pass the initial text in TextField as
  // "Enter DOB" and after a date is picked from the datePicker
  // it will get updated.
  // And guess what it is also editable...Hurray...
  var controller = TextEditingController();

  /// [Defining a dateFormat pattern.]
  DateFormat formattedDate = DateFormat("dd-MM-yyyy");

  // DateTime variable for storing the selectedDate from the
  // showDatePicker Future method.
  DateTime selectedDate; // initial value = null;
  selectDate(BuildContext context) async {
    var picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      // passing the selectedDate to the controller.
      String formattedSelectedDate = formattedDate.format(selectedDate);
      controller.text = formattedSelectedDate;
      // And passing the controller.text to changeDOB(String value).
      // WHY??
      // Because, sometime user may not select the dates from the datePicker
      // They may directly enter date of birth by typing, therefore this will
      // set the value of conroller.text as a userInput,
      /// [important] And also this method will also set the date selected from the datePicker
      // to the textField and store the picked date to '_dob' variable through a getter 'dob'.
      // If it is not called here then the date selected from the datePicker would
      // give a null value as a selectedDate.
      changeDOB(controller.text);
    }
    // notifying all the listeners for this state change
    notifyListeners();
  }

  void changeDOB(String value) {
    // This is the error validation method.
    try {
      // parsing the String into the formatted DateTime type.
      // It is necessary for the validation purpose.
      formattedDate.parse(value);

      // further improving the validation method
      if ("${(formattedDate.parse(value).year)}".length != 4) {
        _dob = ValidationItem(null, "Enter a valid year");

        /// TODO:// [implement the following logic]
        // } else if (formattedDate.parse(value).day > 31) {
        //   _dob = ValidationItem(null, "Enter a valid day");
        // } else if (formattedDate.parse(value).month > 12) {
        //   _dob = ValidationItem(null, "Enter a valid month");
      } else {
        if (DateTime.now().year - (formattedDate.parse(value)).year >= 16) {
          // if the age is more than 16 then validation succeds, else fails.
          _dob = ValidationItem(value, null);
        } else if ((formattedDate.parse(value)).year > DateTime.now().year) {
          // if the user enters birth year more than the current year then validation fails,
          // else validation is succeeds.
          _dob = ValidationItem(null, "Enter a valid year");
        } else {
          // returns error message when the validation fails.
          _dob = ValidationItem(null, "Age should not be less than 16");
        }
      }
    } catch (error) {
      // returns error message when the DOB format is invalid.
      _dob = ValidationItem(null, "Use Correct Format");
    }
    notifyListeners();
  }

  /// [getter for the submit button]
  void submitData() {
    // This will submit the data to a DB or may be used for any other functionalities.
    print("FullName: ${_fullName.value}\nDOB: ${_dob.value}");
    notifyListeners();
  }
}
