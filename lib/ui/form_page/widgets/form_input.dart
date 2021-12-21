import 'package:flutter/material.dart';
import 'package:flutter_form/enum/input_type_enum.dart';

Map<InputTypeEnum, String> _inputTypesList = <InputTypeEnum, String>{
  InputTypeEnum.email : 'Email',
  InputTypeEnum.name : 'Name',
  InputTypeEnum.phone : 'Phone',
  InputTypeEnum.disabled : 'Disabled Input',
};

class FormInput extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final InputTypeEnum inputType;
  final IconData? icon;
  final bool enabled;
  final TextEditingController controller;

  const FormInput({
    Key? key,
    required this.validator,
    required this.inputType,
    this.icon,
    this.enabled = true,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: _inputTypesList[inputType],
        helperMaxLines: 2,
      ),
      validator: validator,
      enabled: enabled,
      controller: controller,
    );
  }
}
