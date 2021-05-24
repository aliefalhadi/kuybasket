import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid,
  empty
}

class PasswordValidation extends FormzInput<String, PasswordValidationError> {
  const PasswordValidation.pure() : super.pure('');
  const PasswordValidation.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }else if(value.length < 4){
      return PasswordValidationError.invalid;
    }
    return null;
  }
}

extension Explanation on PasswordValidationError {
  String get name {
    switch(this) {
      case PasswordValidationError.invalid:
        return "Invalid condition";
      default:
        return null;
    }
  }
}