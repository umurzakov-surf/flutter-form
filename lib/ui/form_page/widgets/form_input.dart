import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? textInputFormatters;

  const FormInput({
    Key? key,
    required this.validator,
    required this.inputType,
    this.icon,
    this.enabled = true,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.textInputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: _inputTypesList[inputType],
      ),
      validator: validator,
      enabled: enabled,
      controller: controller,
      inputFormatters: textInputFormatters,
    );
  }
}
