import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['name'];
  final pascal = _pascalCase(featureName);
  final snake = _snakeCase(featureName);

  final locatorFile =
      File('lib/core/di/service_locator.dart');

  if (!locatorFile.existsSync()) {
    context.logger.err('service_locator.dart not found');
    return;
  }

  var content = locatorFile.readAsStringSync();

  final importLine =
  "import 'package:moksha_path/features/$snake/di/${snake}_di.dart';";
  final registerLine = '  register$pascal(sl);';

  // Add import if missing
  if (!content.contains(importLine)) {
    content = importLine + '\n' + content;
  }

  // Add registration if missing
  if (!content.contains(registerLine)) {
    content = content.replaceFirst(
      '// mason:feature-registration',
      '$registerLine\n  // mason:feature-registration',
    );
  }

  locatorFile.writeAsStringSync(content);
}

String _pascalCase(String input) =>
    input
        .split('_')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join();

String _snakeCase(String input) =>
    input.replaceAllMapped(
        RegExp(r'[A-Z]'),
        (m) => '_${m.group(0)!.toLowerCase()}')
      .replaceFirst('_', '');
