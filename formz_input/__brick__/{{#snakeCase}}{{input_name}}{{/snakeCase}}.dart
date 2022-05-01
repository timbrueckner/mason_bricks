import 'package:formz/formz.dart';

enum {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError { empty }

class {{#pascalCase}}{{input_name}}{{/pascalCase}} extends FormzInput<String, {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError> {
  const {{#pascalCase}}{{input_name}}{{/pascalCase}}.pure() : super.pure('');

  const {{#pascalCase}}{{input_name}}{{/pascalCase}}.dirty({String value = ''}) : super.dirty(value);

  @override
  {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError.empty;
  }
}
