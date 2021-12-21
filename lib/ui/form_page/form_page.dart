import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter_form/enum/input_type_enum.dart';
import 'package:flutter_form/service/model/position.dart';
import 'package:flutter_form/ui/form_page/form_page_wm.dart';
import 'package:flutter_form/ui/form_page/widgets/form_input.dart';

class FormPage extends ElementaryWidget<FormPageWM> {
  const FormPage({Key? key}) : super(formPageWMFactory, key: key);

  @override
  Widget build(FormPageWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: wm.formKey,
          child: Column(
            children: [
              FormInput(
                validator: wm.validateEmail,
                inputType: InputTypeEnum.email,
                icon: Icons.email,
                controller: wm.emailController,
              ),
              FormInput(
                validator: wm.validateName,
                inputType: InputTypeEnum.name,
                icon: Icons.person,
                controller: wm.nameController,
              ),
              FormInput(
                validator: wm.validatePhone,
                inputType: InputTypeEnum.phone,
                icon: Icons.phone,
                controller: wm.phoneController,
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
                        validator: wm.validateDisabled,
                        inputType: InputTypeEnum.disabled,
                        icon: Icons.disabled_by_default,
                        enabled: isEnabled,
                        controller: wm.disabledController,
                      ),
                    ],
                  );
                },
              ),
              EntityStateNotifierBuilder<List<Position>>(
                listenableEntityState: wm.positionState,
                builder: (_, data) {
                  if (data == null) {
                    return const CircularProgressIndicator();
                  }
                  return DropdownButtonFormField<int>(
                    value: wm.selectedPosition,
                    validator: wm.validatePosition,
                    items: [
                      for (final position in data)
                        DropdownMenuItem(
                          value: position.id,
                          child: Text(position.label),
                        )
                    ],
                    onChanged: wm.changeDropdown,
                    hint: const Text('Должность'),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: wm.validateForm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
