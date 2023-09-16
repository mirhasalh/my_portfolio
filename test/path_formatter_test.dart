import 'package:flutter_test/flutter_test.dart';

import 'package:my_portfolio/src/utils.dart' show viewImagePathFormat;

void main() {
  test('Path formatter test', () {
    const path = 'LpS33rcIMG-20230521-195115.png';

    final formatted = viewImagePathFormat(path);
    expect(formatted, '/LpS33rc/IMG-20230521-195115.png');
  });
}
