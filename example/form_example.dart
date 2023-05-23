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