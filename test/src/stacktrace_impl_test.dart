/* Copyright (C) S. Brett Sutton - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
 */

import 'dart:async';

import 'package:stacktrace_impl/stacktrace_impl.dart';
import 'package:test/test.dart';

void main() {
  test('stacktrace impl ...', () async {
    /// create a stack trace from the current line.
    StackTraceImpl(skipFrames: 1);

    runZonedGuarded(() {
      print('hi');
    }, (Object e, StackTrace st) {
      /// Create a StackTraceImpl from a StackTrace
      var sti = StackTraceImpl.fromStackTrace(st);
      for (var frame in sti.frames) {
        print('${frame.sourceFile} ${frame.lineNo} ${frame.column}');
      }
    });
  });
}
