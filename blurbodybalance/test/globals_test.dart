import 'package:flutter_test/flutter_test.dart';
import 'package:blurbodybalance/globals.dart';
import 'package:flutter/material.dart';

void main() {
  group('Dark Mode', () {
    test('Dark Mode should be inactive at start', () {
      final dark = isDark;

      expect(dark, false);
    });
  });
}
