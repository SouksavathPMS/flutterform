import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workingwithform_flutter/constants/enums.dart';

import '../providers/normal_text_form_field_provider.dart';
import '../widgets/custom_normal_text_field.dart';
import '../widgets/main_button.dart';

class NormalTextFormField extends StatefulWidget {
  const NormalTextFormField({super.key});

  @override
  State<NormalTextFormField> createState() => _NormalTextFormFieldState();
}

class _NormalTextFormFieldState extends State<NormalTextFormField> {
  @override
  Widget build(BuildContext context) {
    final normalTextFormFieldProvider =
        context.read<NormalTextFormFieldProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: Form(
          key: normalTextFormFieldProvider.formKey,
          child: const Column(
            children: [
              CustomNormalTextField(formType: FormType.name),
              SizedBox(height: 10),
              CustomNormalTextField(formType: FormType.age),
              SizedBox(height: 10),
              CustomNormalTextField(formType: FormType.email),
              SizedBox(height: 10),
              CustomNormalTextField(formType: FormType.confirm),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: MainButton(
          onPressed: () {
            normalTextFormFieldProvider.setData();
          },
        ),
      ),
    );
  }
}
