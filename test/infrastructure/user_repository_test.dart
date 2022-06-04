import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/infrastructure/user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_fixture.dart';
import 'user_repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getUsers:', () {
    test('returns a List of Users if the http call completes successfully',
        () async {
      final client = MockClient();

      when(
        client.get(Uri.parse(baseUrl)),
      ).thenAnswer(
        (_) async => http.Response(cListUserJson, 200),
      );

      final result = await UserRepository(client).getUsers();

      expect(
        result,
        isA<Either<String, List<User>>>(),
      );

      expect(result.isRight(), true);
    });

    test('returns a String if the http call completes with an error', () async {
      final client = MockClient();

      when(
        client.get(Uri.parse(baseUrl)),
      ).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );

      final result = await UserRepository(client).getUsers();

      expect(
        result,
        isA<Either<String, List<User>>>(),
      );

      expect(result.isLeft(), true);
    });

    test('returns a String if the response is malformed', () async {
      final client = MockClient();

      when(
        client.get(Uri.parse(baseUrl)),
      ).thenAnswer(
        (_) async => http.Response(cMalformedResponse, 200),
      );

      final result = await UserRepository(client).getUsers();

      expect(
        result,
        isA<Either<String, List<User>>>(),
      );

      expect(result.isLeft(), true);
    });
  });
}
