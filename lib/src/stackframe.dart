import 'dart:io';

///
/// A single frame from a stack trace.
/// Holds the sourceFile name and line no.
///
class Stackframe {
  ///
  final File sourceFile;

  ///
  final int lineNo;

  ///
  final int column;

  ///
  final String details;

  ///
  Stackframe(this.sourceFile, this.lineNo, this.column, this.details);
}
