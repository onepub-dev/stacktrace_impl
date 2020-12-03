Provides a implementation of the Dart StrackTrace.

StacktraceImpl allows you to allocate a stack trace from within your own code.

```
    /// create a stack trace from the current line.
    var stack = StackTraceImpl(skipFrames: 1);

    for (var frame in stack.frames) {
        print('${frame.sourceFile} ${frame.lineNo} ${frame.column}');
    }

    runZoned(() {
      print('hi');
    }, onError: (Object e, StackTrace st) {

      /// Create a StackTraceImpl from a StackTrace
      var sti = StackTraceImpl.fromStackTrace(st);

      for (var frame in sti.frames) {
        print('${frame.sourceFile} ${frame.lineNo} ${frame.column}');
      }
    });


    /// output a formatted stack trace
    /// Show the path to each source file.
    /// skip the first frame.
    /// Only show the next 10 frames.
    print(stack.formatStackTrace(showPath: true, methodCount: 10, skipFrames:1));


```



