import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:workingwithform_flutter/constants/enums.dart';

import '../providers/flutter_form_builder_provider.dart';

class CustomFormBuilderTextField extends StatelessWidget {
  const CustomFormBuilderTextField({
    super.key,
    required this.formType,
  });
  final FormType formType;

  @override
  Widget build(BuildContext context) {
    final flutterFormBuilderProvider =
        context.read<FlutterFormBuilderProvider>();
    return FormBuilderTextField(
      name: formType.value,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        filled: true,
        isDense: true,
        border: const OutlineInputBorder(),
        hintText: formType.value,
        prefixIcon: const Icon(Icons.person),
        suffixIcon: IconButton(
          onPressed: () {
            flutterFormBuilderProvider
                .formKey.currentState!.fields[formType.value]
                ?.didChange(null);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      validator: flutterFormBuilderProvider.getValidation(formType),
    );
  }
}
