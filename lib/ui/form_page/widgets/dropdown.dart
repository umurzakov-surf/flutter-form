import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/service/model/position.dart';

import '../../../validation.dart';

class Dropdown extends StatelessWidget {
  final ListenableState<EntityState<List<Position>>> positionState;
  final int? selectedPosition;
  final Function(int?) changeDropdown;

  const Dropdown({
    Key? key,
    required this.positionState,
    required this.selectedPosition,
    required this.changeDropdown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EntityStateNotifierBuilder<List<Position>>(
      listenableEntityState: positionState,
      builder: (_, data) {
        if (data == null) {
          return const CircularProgressIndicator();
        }

        return DropdownButtonFormField<int>(
          value: selectedPosition,
          validator: Validation().validatePosition,
          items: [
            for (final position in data)
              DropdownMenuItem<int>(
                value: position.id,
                child: Text(position.label),
              ),
          ],
          onChanged: changeDropdown,
          hint: const Text('Должность'),
        );
      },
    );
  }
}
