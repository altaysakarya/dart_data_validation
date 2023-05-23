# Dart Data Validation

A package for data validation in Dart.

## Overview

The `dart_data_validation` package provides a set of utilities for validating data in Dart applications. It allows you to define custom validation rules and apply them to different types of data.

## Installation

To use this package, add `dart_data_validation` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  dart_data_validation: ^1.0.1
```

## Buy Me A Coffee ☕️

<a href="https://www.buymeacoffee.com/altaysakarya" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

### Features

* Data validation: Validate your data using custom rules and exclude specific data types from validation.
* Validation result: Get detailed information about the validation result, including whether the data is valid or not, and the list of error messages if validation fails.
* TextFormField validation: Conveniently validate user input in Flutter's TextFormField widget using the textFormFieldValidator method.
* Easy to use: Simply define your validation rules and use the validate method or textFormFieldValidator method for validation.
* Customizable error messages: Provide custom error messages for validation failures to give meaningful feedback to users.
* Flexible rule definition: Define validation rules as functions that take a dynamic parameter and return a boolean value, allowing for complex validation scenarios.
* Integration with Flutter: Seamlessly integrate data validation into your Flutter applications.

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

### Validator Example

<img src="https://raw.githubusercontent.com/altaysakarya/dart_data_validation/abe289e7b6ac9aaaddbcfa05a6f4566d5ed24991/gif_video.gif?raw=true" height="400" alt="Example GIF">


```dart
import 'package:flutter/material.dart';
import 'package:dart_data_validation/dart_data_validation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final validator = Validator(
    validationRules: [
      (data) => data.isNotEmpty, // Rule: String must not be empty
      (data) => data.length > 8 && data.length < 18, // Rule: Length must be between 8 and 18
    ],
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Enter a value',
                    ),
                    validator: (value) {
                      final errorMessage = validator.textFormFieldValidator(value, errorMessage: "Please enter a valid action.\n• Must not be blank\n• 8-18 characters");
                      return errorMessage;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Validate the form

                      if (formKey.currentState!.validate()) {
                        print('Form is valid.');
                      } else {
                        print('Form is invalid.');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

