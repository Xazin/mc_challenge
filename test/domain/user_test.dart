import 'package:flutter_test/flutter_test.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/presentation/user/widgets/info.dart';

import 'user_fixture.dart';

void main() {
  group('user:', () {
    test('test fromJson member', () {
      final tUser = User.fromJson(cUserJson);

      expect(tUser, isA<User>());
      expect(tUser.name, cUser.name);
    });

    test('test toInfo member', () {
      final tUser = User.fromJson(cUserJson);

      expect(tUser.toInfos(), isA<List<Info>>());
      expect(tUser.toInfos().length, 3);
    });
  });
}
