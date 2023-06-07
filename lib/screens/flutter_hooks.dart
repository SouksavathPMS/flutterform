import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../widgets/main_button.dart';

class FlutterHooks extends HookWidget {
  const FlutterHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final ageController = useTextEditingController();
    final emailController = useTextEditingController();
    final confirmController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: 'Age',
                  prefixIcon: Icon(Icons.person_add_alt_rounded),
                ),
                validator: (value) {
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
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
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
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: confirmController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(),
                  hintText: 'Confirm',
                  prefixIcon: Icon(Icons.check_circle),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is requried';
                  } else if (value.trim() != "CONFIRM") {
                    return "Please type 'CONFIRM'";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: MainButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              print(nameController.text);
              print(ageController.text);
              print(emailController.text);
              print(confirmController.text);
            }
          },
        ),
      ),
    );
  }
}
