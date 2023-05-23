import 'package:dart_data_validation/dart_data_validation.dart';

void main() {
  // Define validation rules
  final validationRules = [
    (data) => data != null, // Rule: Data must not be null
    (data) => data is String, // Rule: Data must be a string
    (data) => data.isNotEmpty, // Rule: String must not be empty
  ];

  // Create a new validator
  final validator = Validator(validationRules: validationRules);

  // Validate data
  const data = 'Hello, world!';
  final validationResult = validator.validate(data);

  // Check the validation result
  if (validationResult.isValid) {
    print('Data is valid.');
  } else {
    print('Data is invalid. Errors: ${validationResult.errors}');
  }
}