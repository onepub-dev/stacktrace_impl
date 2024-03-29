/* Copyright (C) S. Brett Sutton - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
 */

import 'dart:io';

///
/// A single frame from a stack trace.
/// Holds the sourceFile name and line no.
///
class Stackframe {
  ///
  Stackframe(
      {required this.sourceType,
      required this.sourceFile,
      required this.lineNo,
      required this.column,
      required this.details});

  /// The source of the file for this stack frame.
  final FrameSourceType sourceType;

  ///
  final File sourceFile;

  ///
  final int lineNo;

  ///
  final int column;

  ///
  final String? details;
}

/// Indicates where the source file came from
///
enum FrameSourceType {
  /// located in a package.
  package,

  /// on the local disk
  file,

  /// unknown
  other
}
