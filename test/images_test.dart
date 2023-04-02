import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:be_gelled/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.logo).existsSync(), true);
    expect(File(Images.iconCallIconRed).existsSync(), true);
  });
}
