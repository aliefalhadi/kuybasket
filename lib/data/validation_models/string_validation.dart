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

extension Explanation on StringValidationError {
  String get nama {
    switch(this) {
      case StringValidationError.empty:
        return "Inputan tidak boleh kosong";
      default:
        return null;
    }
  }
}