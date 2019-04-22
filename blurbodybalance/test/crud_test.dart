import 'package:flutter_test/flutter_test.dart';
import 'package:blurbodybalance/pages/Setup/crud.dart';

void main() {
  test('Should be logged in', () {
    final login = CrudMethods();

    login.isLoggedIn();

    expect(login.isLoggedIn(), true);
  });
}
