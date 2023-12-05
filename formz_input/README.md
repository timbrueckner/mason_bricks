# 🧱 FormzInput

This brick generates form inputs using the [formz package][1].

## 🚧 Requirements

Make sure you have the [`formz package`][1] inside your `pubspec.yaml` file.

## Usage 🚀

This brick supports generating form inputs for different data types.

### Create a form input for `String` based fields

In order to create a form input for a `String` based field, run it like this:

```sh
mason make formz_input -o ./output-path --input_name Name --input_type String --initial_value "''" --validate_empty_string true --cache_error_result false
```

This generates a file named `name.dart` in the output path.

```dart
import 'package:formz/formz.dart';

enum NameValidationError { invalid, empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty({String value = ''}) : super.dirty(value);

  @override
  NameValidationError? validator(String value) {
    return value.isEmpty ? NameValidationError.empty : null;
  }
}
```

### Create an input for an `int` based field

In order to create a form input for an `int` based field, you could use something like this:

```sh
mason make formz_input -o ./output-path --input_name Age --input_type int --initial_value 12 --validate_empty_string false --cache_error_result false
```

This generates a file named `age.dart` in the output path, which contains the following code:

```dart
import 'package:formz/formz.dart';

enum AgeValidationError { invalid }

class Age extends FormzInput<int, AgeValidationError> {
  const Age.pure() : super.pure(12);

  const Age.dirty({int value = 12}) : super.dirty(value);

  @override
  AgeValidationError? validator(int value) {
    return null;
  }
}
```

### Create an input for a field which caches the error result

In order to create a form input for a field which caches the error result, you could use something like this:

```sh
mason make formz_input -o ./output-path --input_name Age --input_type int --initial_value 12 --validate_empty_string false --cache_error_result true
```

This isn't a very useful example, but it shows how to use the `--cache_error_result` flag. It makes sense to use
this flag when you have a validator which is expensive to run, and you want to cache the result of the validation.

This generates a file named `age.dart` in the output path, which contains the following code. It also includes
the `FormzInputErrorCacheMixin`:

```dart
import 'package:formz/formz.dart';

enum AgeValidationError { invalid }

class Age extends FormzInput<int, AgeValidationError> with FormzInputErrorCacheMixin {
  Age.pure([super.value = 12]) : super.pure();

  Age.dirty([super.value = 12]) : super.dirty();

  @override
  AgeValidationError? validator(int value) {
    return null;
  }
}
```

## Variables ✨

| Variable                | Description                                                                        | Required | Type     | Example                       |
|-------------------------|------------------------------------------------------------------------------------|----------|----------|-------------------------------|
| `input_name`            | The name of the input field to create a FormzInput for                             | `Yes`    | `string` | `Age`                         |
| `input_type`            | The data type of the input field to create a FormzInput for                        | `Yes`    | `string` | `int`                         |
| `initial_value`         | The initial or the default value to use with the `pure` and `dirty` cuonstructors. | `Yes`    | `string` | `'Hello World'`, `12`, `true` |
| `validate_empty_string` | Whether to include validation for empty strings.                                   | `Yes`    | `bool`   | `true`                        |
| `cache_error_result`    | Whether to include the `FormzInputErrorCacheMixin`                                 | `Yes`    | `bool`   | `true`                        |

[1]: https://pub.dev/packages/formz
