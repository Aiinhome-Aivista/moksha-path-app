part of '{{name}}_bloc.dart';

@immutable
sealed class {{name.pascalCase()}}Event {}

final class {{name.pascalCase()}}Started
    extends {{name.pascalCase()}}Event {

  final String username;
  final String password;

  {{name.pascalCase()}}Started({
    required this.username,
    required this.password,
  });
}

final class {{name.pascalCase()}}Completed
    extends {{name.pascalCase()}}Event {}