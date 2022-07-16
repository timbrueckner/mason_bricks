import 'package:formz/formz.dart';

enum {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError { invalid{{#validate_empty_string}}, empty{{/validate_empty_string}} }

class {{#pascalCase}}{{input_name}}{{/pascalCase}} extends FormzInput<{{{input_type}}}, {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError> {
  const {{#pascalCase}}{{input_name}}{{/pascalCase}}.pure() : super.pure({{{initial_value}}});

  const {{#pascalCase}}{{input_name}}{{/pascalCase}}.dirty({{=<% %>=}}{<%input_type%><%={{ }}=%> value = {{{initial_value}}}}) : super.dirty(value);

  @override
  {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError? validator({{{input_type}}}? value) {
    {{#validate_empty_string}}return value?.isNotEmpty == true ? null : {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError.empty;{{/validate_empty_string}}{{^validate_empty_string}}return null;{{/validate_empty_string}}
  }
}
