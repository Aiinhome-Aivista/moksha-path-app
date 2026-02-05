part of '{{name}}_bloc.dart';


@immutable
sealed class {{name.pascalCase()}}State {}

final class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

final class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}
final class {{name.pascalCase()}}Success extends {{name.pascalCase()}}State {}

final class {{name.pascalCase()}}Failure extends {{name.pascalCase()}}State {}