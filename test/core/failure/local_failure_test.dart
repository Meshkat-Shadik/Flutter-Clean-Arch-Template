import 'package:clean_arch/core/failure/local_failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalFailure.fromException', () {
    test('should convert AssertionError correctly', () {
      final exception = AssertionError('Assertion failed');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'AssertionError');
      expect(failure.message, 'Assertion failed');
    });

    test('should convert ArgumentError correctly', () {
      final exception = ArgumentError('Invalid argument');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'ArgumentError');
      expect(failure.message, 'Invalid argument: null');
    });

    test('should convert RangeError correctly', () {
      final exception = RangeError('Range out of bounds');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'RangeError');
      expect(failure.message, 'Range out of bounds: null');
    });

    test('should convert IndexError correctly', () {
      final exception = IndexError.withLength(5, 3);
      final failure = LocalFailure.fromException(exception);
      debugPrint(failure.toString());

      expect(failure.name, 'IndexError');
      expect(failure.message, 'Index out of range: 5');
    });

    test('should convert UnsupportedError correctly', () {
      final exception = UnsupportedError('Unsupported operation');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'UnsupportedError');
      expect(failure.message, 'Unsupported operation');
    });

    test('should convert UnimplementedError correctly', () {
      final exception = UnimplementedError('Unimplemented feature');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'UnimplementedError');
      expect(failure.message, 'Unimplemented feature');
    });

    test('should convert StateError correctly', () {
      final exception = StateError('Invalid state');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'StateError');
      expect(failure.message, 'Invalid state');
    });

    test('should convert ConcurrentModificationError correctly', () {
      final exception = ConcurrentModificationError();
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'ConcurrentModificationError');
      expect(failure.message, 'Concurrent modification during iteration.');
    });

    test('should convert OutOfMemoryError correctly', () {
      const exception = OutOfMemoryError();
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'OutOfMemoryError');
      expect(failure.message, 'Out of memory');
    });

    test('should convert StackOverflowError correctly', () {
      const exception = StackOverflowError();
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'StackOverflowError');
      expect(failure.message, 'Stack overflow');
    });

    test('should handle generic Exception correctly', () {
      final exception = Exception('Generic exception');
      final failure = LocalFailure.fromException(exception);

      expect(failure.name, 'Exception');
      expect(failure.message, 'Generic exception');
    });

    test('should handle other unrecognized errors correctly', () {
      const error = FormatException('Invalid format');
      final failure = LocalFailure.fromException(error);

      expect(failure.name, 'FormatException');
      expect(failure.message, 'Invalid format');
    });
  });
}
