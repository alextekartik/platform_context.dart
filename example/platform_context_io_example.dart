import 'dart:convert';
import 'package:platform_context/context.dart';

import 'package:platform_context/context_io.dart';
import 'platform_context_example.dart' as common;

main() {
  run(ioPlatformContext);
}

run(PlatformContext context) {
  print(const JsonEncoder.withIndent('  ').convert(context.toMap()));

  common.print = print;
  common.run(context);
}

/*
 linux

 {
  "io": {
    "platform": "linux"
  }
}
 */
