# 🧱 FormzInput

This brick generates a simple string based input using the [formz package][1].

## 🚧 Requirements

Make sure you have the [`formz package`][1] inside your `pubspec.yaml` file.

## Usage 🚀

```sh
mason make formz_input -o ./output-path --input_name Name
```

creates a file named `name.dart` in the output path.

```dart
import 'package:formz/formz.dart';

enum NameValidationError { empty }

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty({String value = ''}) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : NameValidationError.empty;
  }
}
```

## Variables ✨

| Variable | Description                                            | Required   | Type     |
| -------- |--------------------------------------------------------| ---------- | -------- |
| `input_name`   | The name of the input field to create a FormzInput for | `Yes`      | `string` |

[1]: https://pub.dev/packages/formz
