import 'package:flutter_form/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation', () {
    final validator = Validation();

    test('Email validator value should be null', () {
      const testEmail = 'mail@mail.ru';
      final result = validator.validateEmail(testEmail);
      expect(result, null);
    });

    test('Name validator value should be "Enter valid name (minimum 4 characters)"', () {
      const testName = 'asd';
      final result = validator.validateName(testName);
      expect(result, 'Enter valid name (minimum 4 characters)');
    });

    test('Phone validator value should be null', () {
      const testPhone = '123-123-1239';
      final result = validator.validatePhone(testPhone);
      expect(result, null);
    });

    test('Disabled field validator value should be "Valid format XXX-XXX-XXXX"', () {
      const testString = 'asdaf';
      final result = validator.validateDisabled(testString);
      expect(result, 'Valid format XXX-XXX-XXXX');
    });

    test('Dropdown validator value should be null', () {
      final result = validator.validatePosition(1);
      expect(result, null);
    });
  });
}
