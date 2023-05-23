library dart_data_validation;

import 'package:dart_data_validation/validation_result.dart';

/// A package for data validation in Dart.
class Validator {
  final List<Type> excludedTypes;
  final List<Function(dynamic)> validationRules;

  /// Constructs a new instance of [Validator].
  ///
  /// [excludedTypes] is a list of data types that should be excluded from validation.
  /// [validationRules] is a list of validation rules as functions that take a dynamic parameter and return a boolean value.
  Validator({this.excludedTypes = const [], this.validationRules = const []});

  /// Validates the given [data] using the configured validation rules.
  ///
  /// Returns a [ValidationResult] object representing the result of the validation.
  /// [dataValidationFailedMessage] is an optional custom message to be included in the invalid result.
  /// [typeNotAllowedMessage] is an optional custom message to be included in the invalid result when the data type is excluded.
  ValidationResult validate(dynamic data, {String? dataValidationFailedMessage, String? typeNotAllowedMessage}) {
    // Check if the data type is excluded from validation
    if (excludedTypes.contains(data.runtimeType)) {
      return ValidationResult.invalid([typeNotAllowedMessage ?? 'Data type not allowed.']);
    }

    // Apply the validation rules
    for (var rule in validationRules) {
      if (!rule(data)) {
        return ValidationResult.invalid([dataValidationFailedMessage ?? 'Data validation failed.']);
      }
    }

    // Data passed all validation rules
    return ValidationResult.valid();
  }

  /// Validates a value for a TextFormField.
  ///
  /// Returns an error message if the value is invalid, or null if it is valid.
  ///
  /// [value] is the value to be validated.
  /// [errorMessage] is an optional custom error message to be returned if the value is invalid.
  String? textFormFieldValidator(String? value, {String? errorMessage}) {
    final validationResult = validate(value, dataValidationFailedMessage: errorMessage);

    // Check if the validation result is invalid
    if (!validationResult.isValid) {
      // Return the first error message
      return validationResult.errors.first;
    }

    // Value is valid
    return null;
  }
}
