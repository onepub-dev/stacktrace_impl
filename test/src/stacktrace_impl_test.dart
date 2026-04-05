/* Copyright (C) S. Brett Sutton - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
 */

import 'dart:async';

import 'package:path/path.dart' hide equals;
import 'package:stacktrace_impl/stacktrace_impl.dart';
import 'package:test/test.dart';

void main() {
  test('stacktrace impl ...', () async {
    /// create a stack trace from the current line.
    final st = StackTraceImpl();
    expect(st.sourceFilename, equals('stacktrace_impl_test.dart'));
    expect(st.sourcePath,
        equals(absolute('test', 'src', 'stacktrace_impl_test.dart')));
    expect(st.lineNo, equals(16));

    final frame = st.frames[0];
    expect(frame.sourceFilename, equals('stacktrace_impl_test.dart'));
    expect(frame.sourcePath,
        equals(absolute('test', 'src', 'stacktrace_impl_test.dart')));
    expect(frame.lineNo, equals(16));
    expect(frame.sourceType, equals(FrameSourceType.file));

    runZonedGuarded(() {
      throw Exception('bad');
    }, (e, st) {
      /// Create a StackTraceImpl from a StackTrace
      final sti = StackTraceImpl.fromStackTrace(st);
      for (final frame in sti.frames) {
        print('${frame.sourceFilename} ${frame.lineNo} ${frame.column}');
      }
    });
  });
}
