import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.camelCase()}}.freezed.dart';
part '{{name.camelCase()}}.g.dart';

@freezed
class {{name.pascalCase()}} with _${{name.pascalCase()}} {
  const factory {{name.pascalCase()}}() = _{{name.pascalCase()}};

  factory {{name.pascalCase()}}.fromJson(Map<String, Object?> json) => _${{name.pascalCase()}}FromJson(json);
}
