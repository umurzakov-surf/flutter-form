import 'package:elementary/elementary.dart';
import 'package:flutter_form/service/model/position.dart';
import 'package:flutter_form/service/repository/position_repository.dart';

class FormPageModel extends ElementaryModel {
  final PositionRepository _positionRepository;

  FormPageModel(this._positionRepository) : super();

  List<Position> getPositionList() {
    return _positionRepository.getPositions();
  }
}
