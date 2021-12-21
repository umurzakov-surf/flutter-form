import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/service/model/position.dart';
import 'package:flutter_form/service/repository/position_repository.dart';
import 'package:flutter_form/ui/form_page/form_page.dart';
import 'package:flutter_form/ui/form_page/form_page_model.dart';
import 'package:flutter_form/ui/success_page/success_page.dart';

FormPageWM formPageWMFactory(BuildContext _) =>
    FormPageWM(FormPageModel(PositionRepository()));

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
  final _positionState = EntityStateNotifier<List<Position>>();

  ValueNotifier<bool> get isEnabled => _isEnabled;
  ListenableState<EntityState<List<Position>>> get positionState => _positionState;
  int? get selectedPosition => _selectedPosition;

  int? _selectedPosition;

  FormPageWM(FormPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _loadPositions();
  }

  void changeDropdown([int? v]) {
    _selectedPosition = v;
  }

  void validateForm() {
    if (formKey.currentState?.validate()?? false) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => const SuccessPage(),
      ));
    }
  }

  void toggleCheckbox(bool? value) {
    _isEnabled.value = value ?? true;
  }

  Function(String?) onFieldSubmitted(FocusNode focus) {
    return (v) {
      FocusScope.of(context).requestFocus(focus);
    };
  }

  void _loadPositions() {
    final positionList = model.getPositionList();
    _positionState.content(positionList);
  }
}
