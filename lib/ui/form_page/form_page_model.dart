import 'package:elementary/elementary.dart';
import 'package:flutter_form/service/model/dropdown_item.dart';
import 'package:flutter_form/ui/form_page/repository/dropdown_repository.dart';

class FormPageModel extends ElementaryModel {
  final DropdownRepository _dropdownRepository;

  FormPageModel(this._dropdownRepository) : super();

  Future<List<DropdownItem>> getDropdownList() async {
    final dropdownList = await _dropdownRepository.getDropdownList();

    return dropdownList;
  }
}
