import 'package:formz/formz.dart';

enum StringValidationError {
  empty,
  invalid
}

class StringValidation extends FormzInput<String, StringValidationError> {
 const StringValidation.pure([String value = '']) : super.pure(value);
 const StringValidation.dirty([String value = '']) : super.dirty(value);

  @override
  StringValidationError validator(String value) {
    if(value.isEmpty == true){
        return StringValidationError.empty;
    }
    return null;
  }
}