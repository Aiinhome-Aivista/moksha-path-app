import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '{{name}}_event.dart';
part '{{name}}_state.dart';

class {{name.pascalCase()}}Bloc
    extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {

  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}Initial()) {
    on<{{name.pascalCase()}}Started>(_onStarted);
  }

  Future<void> _onStarted(
    {{name.pascalCase()}}Started event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    // TODO: implement event handler
  }
}
