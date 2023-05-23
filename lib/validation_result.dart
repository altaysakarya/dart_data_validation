class ValidationResult {
  final bool isValid;
  final List<String> errors;

  ValidationResult(this.isValid, this.errors);

  /// Creates a valid [ValidationResult] instance.
  factory ValidationResult.valid() {
    return ValidationResult(true, []);
  }

  /// Creates an invalid [ValidationResult] instance with the specified [errors].
  factory ValidationResult.invalid(List<String> errors) {
    return ValidationResult(false, errors);
  }
}
