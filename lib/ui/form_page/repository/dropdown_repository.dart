import 'package:flutter_form/service/model/dropdown_item.dart';

class DropdownRepository {
  final List<DropdownItem> dropdownList = [
    DropdownItem(1, 'Разработчик'),
    DropdownItem(2, 'Менеджер'),
  ];

  Future<List<DropdownItem>> getDropdownList() async {
    final result = await Future.delayed(const Duration(seconds: 3), () => dropdownList);

    return result;
  }
}
