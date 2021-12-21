import 'package:flutter_form/service/model/position.dart';

class PositionRepository {
  final List<Position> positionsList = [
    Position(1, 'Разработчик'),
    Position(2, 'Менеджер'),
  ];
  getPositions() {
    return positionsList;
  }
}