import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum PhoneNumberValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template PhoneNumber}
/// Form input for an PhoneNumber input.
/// {@endtemplate}
class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  /// {@macro PhoneNumber}
  const PhoneNumber.pure() : super.pure('');

  /// {@macro PhoneNumber}
  const PhoneNumber.dirty([super.value = '']) : super.dirty();

  static final RegExp _phoneRegExp = RegExp(
    r'\D',
  );

  @override
  PhoneNumberValidationError? validator(String? value) {
    return _phoneRegExp.hasMatch(value ?? '')
        ? null
        : PhoneNumberValidationError.invalid;
  }
}
