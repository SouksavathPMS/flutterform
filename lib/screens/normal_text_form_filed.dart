import 'package:flutter/material.dart';

import '../widgets/main_button.dart';

class NormalTextFormField extends StatefulWidget {
  const NormalTextFormField({super.key});

  @override
  State<NormalTextFormField> createState() => _NormalTextFormFieldState();
}

class _NormalTextFormFieldState extends State<NormalTextFormField> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _emailController;
  late TextEditingController _confirmController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _emailController = TextEditingController();
    _confirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Name',
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () => _nameController.clear(),
                    icon: const Icon(Icons.close),
                  ),
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Age',
                  prefixIcon: const Icon(Icons.person_add_alt_rounded),
                  suffixIcon: IconButton(
                    onPressed: () => _ageController.clear(),
                    icon: const Icon(Icons.close),
                  ),
                ),
                validator: (value) {
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: IconButton(
                    onPressed: () => _emailController.clear(),
                    icon: const Icon(Icons.close),
                  ),
                ),
                validator: (value) {
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _confirmController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Confirm',
                  prefixIcon: const Icon(Icons.check_circle),
                  suffixIcon: IconButton(
                    onPressed: () => _confirmController.clear(),
                    icon: const Icon(Icons.close),
                  ),
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
            if (_formKey.currentState!.validate()) {
              print(_nameController.text);
              print(_ageController.text);
              print(_emailController.text);
              print(_confirmController.text);
            }
          },
        ),
      ),
    );
  }
}
