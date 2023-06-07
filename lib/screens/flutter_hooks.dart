import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workingwithform_flutter/widgets/custom_hooks_text_field.dart';

import '../constants/enums.dart';
import '../widgets/main_button.dart';

class FlutterHooks extends HookWidget {
  const FlutterHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final ageController = useTextEditingController();
    final emailController = useTextEditingController();
    final confirmController = useTextEditingController(text: "CONFIRM");

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomHooksTextField(
                formType: FormType.name,
                textEditingController: nameController,
              ),
              const SizedBox(height: 10),
              CustomHooksTextField(
                formType: FormType.age,
                textEditingController: ageController,
              ),
              const SizedBox(height: 10),
              CustomHooksTextField(
                formType: FormType.email,
                textEditingController: emailController,
              ),
              const SizedBox(height: 10),
              CustomHooksTextField(
                formType: FormType.confirm,
                textEditingController: confirmController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: MainButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Fluttertoast.cancel();
              Fluttertoast.showToast(
                  msg:
                      "Name : ${nameController.text}\n Age : ${ageController.text}\n Email : ${emailController.text}",
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
          },
        ),
      ),
    );
  }
}
