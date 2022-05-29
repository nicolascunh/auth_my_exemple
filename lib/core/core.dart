import 'package:flutter/foundation.dart';
import 'dart:developer' as dev;

class Core {
  static const String title = 'auth test';
  static void log(
    dynamic text, {
    bool isError = false,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode || isError)
      Future.microtask(() {
        dev.log(
          '** $text. isError: [$isError]',
          name: title,
          error: error,
          stackTrace: stackTrace,
        );
      });
  }
}
