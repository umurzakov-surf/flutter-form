import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/service/model/dropdown_item.dart';

import '../../../validation.dart';

class Dropdown extends StatelessWidget {
  final ListenableState<EntityState<List<DropdownItem>>> dropdownState;
  final int? selectedDropdownItem;
  final Function(int?) changeDropdown;

  const Dropdown({
    Key? key,
    required this.dropdownState,
    required this.selectedDropdownItem,
    required this.changeDropdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityStateNotifierBuilder<List<DropdownItem>>(
      listenableEntityState: dropdownState,
      loadingBuilder: (_, __) {
        return const CircularProgressIndicator();
      },
      builder: (_, data) {
        if (data == null) {
          return const CircularProgressIndicator();
        }

        return DropdownButtonFormField<int>(
          value: selectedDropdownItem,
          validator: Validation().validateDropdown,
          items: [
            for (final dropdownItem in data)
              DropdownMenuItem<int>(
                value: dropdownItem.id,
                child: Text(dropdownItem.label),
              ),
          ],
          onChanged: changeDropdown,
          hint: const Text('Должность'),
        );
      },
    );
  }
}
