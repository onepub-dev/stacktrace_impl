import 'dart:async';

import 'package:stacktrace_impl/stacktrace_impl.dart';
import 'package:test/test.dart';

void main() {
  test('stacktrace impl ...', () async {
    /// create a stack trace from the current line.
    StackTraceImpl(skipFrames: 1);

    runZoned(() {
      print('hi');
    }, onError: (Object e, StackTrace st) {
      /// Create a StackTraceImpl from a StackTrace
      var sti = StackTraceImpl.fromStackTrace(st);
      for (var frame in sti.frames) {
        print('${frame.sourceFile} ${frame.lineNo} ${frame.column}');
      }
    });
  });
}
