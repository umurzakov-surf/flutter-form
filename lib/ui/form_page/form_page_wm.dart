import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/service/model/dropdown_item.dart';
import 'package:flutter_form/ui/form_page/form_page.dart';
import 'package:flutter_form/ui/form_page/form_page_model.dart';
import 'package:flutter_form/ui/form_page/repository/dropdown_repository.dart';
import 'package:flutter_form/ui/success_page/success_page.dart';

FormPageWM formPageWMFactory(BuildContext _) =>
    FormPageWM(FormPageModel(DropdownRepository()));

class FormPageWM extends WidgetModel<FormPage, FormPageModel> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController disabledController = TextEditingController();

  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final disabledFocus = FocusNode();

  final ValueNotifier<bool> _isEnabled = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isBtnDisabled = ValueNotifier<bool>(true);
  final _dropdownState = EntityStateNotifier<List<DropdownItem>>();

  ValueNotifier<bool> get isEnabled => _isEnabled;
  ValueNotifier<bool> get isBtnDisabled => _isBtnDisabled;
  ListenableState<EntityState<List<DropdownItem>>> get dropdownState => _dropdownState;
  int? get selectedDropdownItem => _selectedDropdownItem;

  int? _selectedDropdownItem;

  FormPageWM(FormPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _loadDropdownList();
  }

  void changeDropdown([int? v]) {
    _selectedDropdownItem = v;
    _validateForm();
  }

  void toSuccessPage() {
    if (formKey.currentState?.validate()?? false) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => const SuccessPage(),
      ));
    }
  }

  void toggleCheckbox(bool? value) {
    _isEnabled.value = value ?? false;
    _validateForm();
  }

  void onInputChange(String value) {
    _validateForm();
  }

  Function(String?) onFieldSubmitted(FocusNode focus) {
    return (v) {
      FocusScope.of(context).requestFocus(focus);
    };
  }

  Future<void> _loadDropdownList() async {
    _dropdownState.loading();
    final dropdownList = await model.getDropdownList();
    _dropdownState.content(dropdownList);
  }

  void _validateForm() {
    isBtnDisabled.value = !formKey.currentState!.validate();
  }
}
