import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workingwithform_flutter/constants/enums.dart';
import 'package:workingwithform_flutter/providers/normal_text_form_field_provider.dart';

class CustomHooksTextField extends StatelessWidget {
  const CustomHooksTextField({
    super.key,
    required this.formType,
    required this.textEditingController,
  });

  final FormType formType;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final normalTextFormFieldProvider =
        context.read<NormalTextFormFieldProvider>();
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType:
          normalTextFormFieldProvider.getInputType(formType: formType),
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 8, right: 8),
        filled: true,
        isDense: true,
        border: const OutlineInputBorder(),
        hintText: formType.value,
        prefixIcon: const Icon(Icons.person),
        suffixIcon: IconButton(
          onPressed: () => textEditingController.clear(),
          icon: const Icon(Icons.close),
        ),
      ),
      validator: (value) => normalTextFormFieldProvider.getValueDations(
          formType: formType, value: value),
    );
  }
}
