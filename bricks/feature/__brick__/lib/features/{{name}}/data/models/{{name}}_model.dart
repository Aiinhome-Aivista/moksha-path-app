import '../../domain/entities/{{name}}.dart';

class {{name.pascalCase()}}Model extends {{name.pascalCase()}} {
  const {{name.pascalCase()}}Model({required super.id});

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return {{name.pascalCase()}}Model(
      id: json['id'],
    );
  }
}