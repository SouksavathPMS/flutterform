import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:workingwithform_flutter/constants/enums.dart';

class FlutterFormBuilderProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get getFormKey => formKey;

  void setData() {
    if (formKey.currentState!.validate()) {
      final name = formKey.currentState!.fields[FormType.name.value]?.value;
      final age = formKey.currentState!.fields[FormType.age.value]?.value;
      final email = formKey.currentState!.fields[FormType.email.value]?.value;

      Fluttertoast.cancel();
      Fluttertoast.showToast(
          msg: "Name : $name\n Age : $age\n Email : $email",
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

  getValidation(FormType formType) {
    switch (formType) {
      case FormType.name:
        return FormBuilderValidators.required();
      case FormType.age:
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.integer(),
          FormBuilderValidators.min(1),
          FormBuilderValidators.max(150),
        ]);
      case FormType.email:
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ]);
      case FormType.confirm:
        return FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.match("CONFIRM"),
        ]);
    }
  }
}
