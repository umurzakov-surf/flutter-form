import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form/phone_formatter.dart';
import 'package:flutter_form/ui/form_page/enum/input_type_enum.dart';
import 'package:flutter_form/ui/form_page/form_page_wm.dart';
import 'package:flutter_form/ui/form_page/widgets/dropdown.dart';
import 'package:flutter_form/ui/form_page/widgets/form_input.dart';
import 'package:flutter_form/validation.dart';

class FormPage extends ElementaryWidget<FormPageWM> {
  const FormPage({Key? key}) : super(formPageWMFactory, key: key);

  @override
  Widget build(FormPageWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: wm.formKey,
            child: Column(
              children: [
                FormInput(
                  validator: Validation().validateEmail,
                  inputType: InputTypeEnum.email,
                  icon: Icons.email,
                  controller: wm.emailController,
                  focusNode: wm.emailFocus,
                  onFieldSubmitted: wm.onFieldSubmitted(wm.nameFocus),
                  onChanged: wm.onInputChange,
                ),
                FormInput(
                  validator: Validation().validateName,
                  inputType: InputTypeEnum.name,
                  icon: Icons.person,
                  controller: wm.nameController,
                  focusNode: wm.nameFocus,
                  onChanged: wm.onInputChange,
                  onFieldSubmitted: wm.onFieldSubmitted(wm.phoneFocus),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                ),
                FormInput(
                  validator: Validation().validatePhone,
                  inputType: InputTypeEnum.phone,
                  icon: Icons.phone,
                  controller: wm.phoneController,
                  focusNode: wm.phoneFocus,
                  onChanged: wm.onInputChange,
                  onFieldSubmitted: wm.onFieldSubmitted(wm.disabledFocus),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9-]')),
                    PhoneFormatter(sample: 'xxx-xxx-xxxx', separator: '-'),
                  ],
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: wm.isEnabled,
                  builder: (_, isEnabled, __) {
                    return Column(
                      children: [
                        SwitchListTile(
                          title: const Text('Enable disabled input'),
                          onChanged: wm.toggleCheckbox,
                          value: isEnabled,
                        ),
                        FormInput(
                          validator: isEnabled
                              ? Validation().validateDisabled
                              : ([v]) => null,
                          inputType: InputTypeEnum.disabled,
                          icon: Icons.disabled_by_default,
                          enabled: isEnabled,
                          controller: wm.disabledController,
                          focusNode: wm.disabledFocus,
                          onChanged: wm.onInputChange,
                        ),
                      ],
                    );
                  },
                ),
                Dropdown(
                  positionState: wm.positionState,
                  selectedPosition: wm.selectedPosition,
                  changeDropdown: wm.changeDropdown,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: wm.isBtnDisabled,
                  builder: (_, isDisabled, __) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        child: const Text('Submit'),
                        onPressed: isDisabled ? null : wm.toSuccessPage,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
