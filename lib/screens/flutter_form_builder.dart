import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../widgets/main_button.dart';

class FlutterFormBuilder extends StatelessWidget {
  const FlutterFormBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Name',
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      formKey.currentState!.fields["name"]?.didChange(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'age',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Age',
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      formKey.currentState!.fields["age"]?.didChange(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.integer(),
                  FormBuilderValidators.min(1),
                  FormBuilderValidators.max(150),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'email',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      formKey.currentState!.fields["email"]?.didChange(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 10),
              FormBuilderTextField(
                name: 'confirm',
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 8, right: 8),
                  filled: true,
                  isDense: true,
                  border: const OutlineInputBorder(),
                  hintText: 'Confirm',
                  prefixIcon: const Icon(Icons.person),
                  suffixIcon: IconButton(
                    onPressed: () {
                      formKey.currentState!.fields["confirm"]?.didChange(null);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.equal("CONFIRM"),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: MainButton(
          onPressed: () {
            final valueField = formKey.currentState!;
            if (formKey.currentState!.validate()) {
              print(valueField.fields['name']?.value);
              print(valueField.fields['age']?.value.runtimeType);
              print(valueField.fields['email']?.value);
              print(valueField.fields['confirm']?.value);
            }
          },
        ),
      ),
    );
  }
}
