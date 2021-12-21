import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/service/model/position.dart';
import 'package:flutter_form/service/repository/position_repository.dart';
import 'package:flutter_form/ui/form_page/form_page.dart';
import 'package:flutter_form/ui/form_page/form_page_model.dart';
import 'package:flutter_form/ui/success_page/success_page.dart';
import 'package:flutter_form/validation.dart';

FormPageWM formPageWMFactory(BuildContext context) =>
    FormPageWM(FormPageModel(PositionRepository()));

class FormPageWM extends WidgetModel<FormPage, FormPageModel> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController disabledController = TextEditingController();
  final ValueNotifier<bool> _isEnabled = ValueNotifier<bool>(false);
  final _positionState = EntityStateNotifier<List<Position>>();
  int? _selectedPosition;

  ValueNotifier<bool> get isEnabled => _isEnabled;
  ListenableState<EntityState<List<Position>>> get positionState => _positionState;
  int? get selectedPosition => _selectedPosition;

  FormPageWM(FormPageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    _loadPositions();
  }

  String? validateEmail([String? v]) {
    if (v != null && v.isValidEmail) {
      return null;
    } else {
      return 'Enter valid email';
    }
  }

  String? validateName([String? v]) {
    if (v != null && v.isValidName) {
      return null;
    } else {
      return 'Enter valid name';
    }
  }

  String? validatePhone([String? v]) {
    if (v != null && v.isValidPhone) {
      return null;
    } else {
      return 'Enter valid phone';
    }
  }

  String? validateDisabled([String? v]) {
    if (v != null && v.isValidPhone || !_isEnabled.value) {
      return null;
    } else {
      return 'Enter 4 or more symbols';
    }
  }

  String? validatePosition([Object? v]) {
    if(v != null) {
      return null;
    } else {
      return 'Select position';
    }
  }

  void changeDropdown([Object? v]) {
    _selectedPosition = int.parse('$v');
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => const SuccessPage(),
      ));
    }
  }

  void toggleCheckbox(bool? value) {
    _isEnabled.value = value ?? true;
  }

  void _loadPositions() {
    var positionList = model.getPositionList();
    _positionState.content(positionList);
  }
}
