# dart_data_validation

A package for data validation in Dart.

## Overview

The `dart_data_validation` package provides a set of utilities for validating data in Dart applications. It allows you to define custom validation rules and apply them to different types of data.

## Installation

To use this package, add `dart_data_validation` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  dart_data_validation: ^1.0.0
```

## Buy Me A Coffee ☕️

<a href="https://www.buymeacoffee.com/altaysakarya" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

### Usage

Import the package in your Dart file:

```dart
import 'package:dart_data_validation/dart_data_validation.dart';
```

## Validator Class

The `Validator` class is the main entry point for data validation. It provides methods to define validation rules and validate data against those rules.

Constructor
Create a new instance of `Validator` by specifying the `excludedTypes` and `validationRules` parameters:

```dart
Validator({
  List<Type> excludedTypes = const [],
  List<Function(dynamic)> validationRules = const [],
})
```

* `excludedTypes` (optional): A list of data types that should be excluded from validation.
* `validationRules` (optional): A list of validation rules as functions that take a dynamic parameter and return a boolean value.

Validation
The validate method is used to validate data against the configured validation rules:

```dart
ValidationResult validate(dynamic data, {
  String? dataValidationFailedMessage,
  String? typeNotAllowedMessage,
})
```

`data`: The data to be validated.
`dataValidationFailedMessage` (optional): A custom message to be included in the invalid result if the data fails validation.
`typeNotAllowedMessage` (optional): A custom message to be included in the invalid result when the data type is excluded.

The `validate` method returns a `ValidationResult` object that represents the result of the validation.

TextFormField Validation
The `textFormFieldValidator` method is a convenience method for validating values specifically for TextFormField:

```dart
String? textFormFieldValidator(String? value, {String? errorMessage})
```

`value`: The value to be validated.
`errorMessage` (optional): A custom error message to be returned if the value is invalid.

### Example

Here's an example usage of the `dart_data_validation` package:

```dart
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
  final data = 'Hello, world!';
  final validationResult = validator.validate(data);

  // Check the validation result
  if (validationResult.isValid) {
    print('Data is valid.');
  } else {
    print('Data is invalid. Errors: ${validationResult.errors}');
  }
}
```
