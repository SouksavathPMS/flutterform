import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workingwithform_flutter/constants/enums.dart';

class NormalTextFormFieldProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final confirmController = TextEditingController(text: "CONFIRM");

  void setData() {
    if (_formKey.currentState!.validate()) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "TO THE MOON ^>^",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "VALID FORM T T",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  TextInputType getInputType({required FormType formType}) {
    switch (formType) {
      case FormType.name:
        return TextInputType.name;
      case FormType.age:
        return TextInputType.number;
      case FormType.email:
        return TextInputType.emailAddress;
      case FormType.confirm:
        return TextInputType.name;
    }
  }

  TextEditingController getController({required FormType formType}) {
    switch (formType) {
      case FormType.name:
        return nameController;
      case FormType.age:
        return ageController;
      case FormType.email:
        return emailController;
      case FormType.confirm:
        return confirmController;
    }
  }

  String? getValueDations({required FormType formType, String? value}) {
    switch (formType) {
      case FormType.name:
        if (value == null || value.trim().isEmpty) {
          return 'Please enter your name';
        }
        return null;
      case FormType.age:
        bool isInteger(num value) =>
            value is int || value == value.roundToDouble();
        try {
          if (value == null || value.isEmpty) {
            return 'Please enter your age';
          } else if (value.startsWith(".")) {
            return 'Min age is 1';
          } else if (!isInteger(num.parse(value))) {
            return 'Please enter only integer';
          } else if (int.tryParse(value) == null) {
            return 'Please enter only number';
          } else if (int.tryParse(value)!.isNegative) {
            return 'Please enter non-negative numbers';
          } else if (int.tryParse(value)! > 150) {
            return 'Please enter a valid age below 150';
          }
        } on Exception {
          return 'Please enter a valid number';
        }
        return null;
      case FormType.email:
        bool validateEmail(String email) {
          if (email.isEmpty) {
            return false;
          }
          final emailRegExp = RegExp(
            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
            caseSensitive: false,
          );
          return emailRegExp.hasMatch(email);
        }
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!validateEmail(value)) {
          return "Please enter valid email";
        }
        return null;
      case FormType.confirm:
        if (value == null || value.isEmpty) {
          return 'This field is requried';
        } else if (value.trim() != "CONFIRM") {
          return "Please type 'CONFIRM'";
        }
        return null;
    }
  }
}
