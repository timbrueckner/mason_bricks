import 'package:formz/formz.dart';

enum {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError { invalid{{#validate_empty_string}}, empty{{/validate_empty_string}} }

class {{#pascalCase}}{{input_name}}{{/pascalCase}} extends FormzInput<{{{input_type}}}, {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError>{{^cache_error_result}} { {{/cache_error_result}}{{#cache_error_result}} with FormzInputErrorCacheMixin { {{/cache_error_result}}
  {{^cache_error_result}}const {{#pascalCase}}{{input_name}}{{/pascalCase}}.pure() : super.pure({{{initial_value}}});

  const {{#pascalCase}}{{input_name}}{{/pascalCase}}.dirty({{=<% %>=}}{<%input_type%><%={{ }}=%> value = {{{initial_value}}}}) : super.dirty(value);{{/cache_error_result}}{{#cache_error_result}}{{#pascalCase}}{{input_name}}{{/pascalCase}}.pure([super.value = {{{initial_value}}}]) : super.pure();

  {{#pascalCase}}{{input_name}}{{/pascalCase}}.dirty([super.value = {{{initial_value}}}]) : super.dirty();{{/cache_error_result}}

  @override
  {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError? validator({{{input_type}}} value) {
    {{#validate_empty_string}}return value.isEmpty ? {{#pascalCase}}{{input_name}}{{/pascalCase}}ValidationError.empty : null;{{/validate_empty_string}}{{^validate_empty_string}}return null;{{/validate_empty_string}}
  }
}
