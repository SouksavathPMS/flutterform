import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:workingwithform_flutter/constants/enums.dart';

import '../providers/flutter_form_builder_provider.dart';
import '../widgets/custom_form_builder_text_field.dart';
import '../widgets/main_button.dart';

class FlutterFormBuilder extends StatelessWidget {
  const FlutterFormBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final flutterFormBuilderProvider =
        context.read<FlutterFormBuilderProvider>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: FormBuilder(
          key: flutterFormBuilderProvider.formKey,
          initialValue: {
            FormType.confirm.value: "CONFIRM",
          },
          child: const Column(
            children: [
              CustomFormBuilderTextField(formType: FormType.name),
              SizedBox(height: 10),
              CustomFormBuilderTextField(formType: FormType.age),
              SizedBox(height: 10),
              CustomFormBuilderTextField(formType: FormType.email),
              SizedBox(height: 10),
              CustomFormBuilderTextField(formType: FormType.confirm),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: MainButton(
          onPressed: () => flutterFormBuilderProvider.setData(),
        ),
      ),
    );
  }
}
