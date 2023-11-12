import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/src/utils.dart';

void main() {
  test('Get host name test', () {
    const url = 'https://github.com/pwdev23/boros_app';
    final hostName = getHostName(url);
    expect(hostName, 'github.com');
  });
}
