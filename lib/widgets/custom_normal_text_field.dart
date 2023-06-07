import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workingwithform_flutter/constants/enums.dart';
import 'package:workingwithform_flutter/providers/normal_text_form_field_provider.dart';

class CustomNormalTextField extends StatelessWidget {
  const CustomNormalTextField({
    super.key,
    required this.formType,
    this.initialValue,
  });

  final FormType formType;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final normalTextFormFieldProvider =
        context.read<NormalTextFormFieldProvider>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType:
          normalTextFormFieldProvider.getInputType(formType: formType),
      controller: normalTextFormFieldProvider.getController(formType: formType),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        filled: true,
        isDense: true,
        border: const OutlineInputBorder(),
        hintText: formType.value,
        prefixIcon: const Icon(Icons.person),
        suffixIcon: IconButton(
          onPressed: () => normalTextFormFieldProvider
              .getController(formType: formType)
              .clear(),
          icon: const Icon(Icons.close),
        ),
      ),
      validator: (value) => normalTextFormFieldProvider.getValueDations(
          formType: formType, value: value),
    );
  }
}
