import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:be_gelled/utils/assets/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.banner).existsSync(), true);
    expect(File(Images.bikeRide).existsSync(), true);
    expect(File(Images.boxDelivery).existsSync(), true);
    expect(File(Images.familyMember).existsSync(), true);
    expect(File(Images.healthyLifestyle).existsSync(), true);
    expect(File(Images.inviteFriends).existsSync(), true);
    expect(File(Images.logo).existsSync(), true);
    expect(File(Images.iconArrowDown).existsSync(), true);
    expect(File(Images.iconArrowRight).existsSync(), true);
    expect(File(Images.iconCallIconRed).existsSync(), true);
    expect(File(Images.iconCheckMarkCircle).existsSync(), true);
    expect(File(Images.iconClockCircle).existsSync(), true);
    expect(File(Images.iconHomeSelected).existsSync(), true);
    expect(File(Images.iconHome).existsSync(), true);
    expect(File(Images.iconLocation).existsSync(), true);
    expect(File(Images.iconPlus).existsSync(), true);
    expect(File(Images.iconUserRectangle).existsSync(), true);
    expect(File(Images.iconWallet).existsSync(), true);
    expect(File(Images.iconWarning).existsSync(), true);
  });
}
