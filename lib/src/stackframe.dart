/* Copyright (C) S. Brett Sutton - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Brett Sutton <bsutton@onepub.dev>, Jan 2022
 */

import 'dart:io';

import 'package:path/path.dart';

///
/// A single frame from a stack trace.
///
class Stackframe {
  ///
  Stackframe(
      {required this.sourceType,
      required this.packageName,
      required this.pathToSourceFile,
      required this.sourceFilename,
      required this.lineNo,
      required this.column,
      required this.details});

  /// The source of the file for this stack frame.
  final FrameSourceType sourceType;

  /// If the [sourceType] is [FrameSourceType.package]
  /// then this will contain the dart package name
  /// the [sourceFilename] comes from.
  /// For all other source
  final String packageName;

  /// The path to [sourceFilename] sans the
  /// filename.
  /// Within a package this will be a relative path
  final String pathToSourceFile;

  /// Name of the source file
  final String sourceFilename;

  /// Returns the path and filename.
  /// For [Stackframe]s of type [FrameSourceType.package] this will
  /// be a relative path within the package.
  String get sourcePath => join(pathToSourceFile, sourceFilename);

  /// returns a file object to the source file.
  /// For [Stackframe]s of type [FrameSourceType.package] this will
  /// be a relative path within the package.
  File get sourceFile => File(join(pathToSourceFile, sourceFilename));

  /// The line number
  final int lineNo;

  /// The column in the line.
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
