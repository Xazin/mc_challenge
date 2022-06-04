import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/i_user_repository.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/domain/user/user_failure.dart';

// TODO: would use environment variables here
const String baseUrl = 'https://jsonplaceholder.typicode.com/users';

class UserRepository implements IUserRepository {
  // TODO: would lazy instantiate a singleton instead of creating a new instance every time
  final http.Client client;

  UserRepository(this.client);

  @override
  Future<Either<UserFailure, List<User>>> getUsers() async {
    try {
      // TODO: If multiple methods implement the baseUri, it's best to use _baseUri.replace()
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        return right<UserFailure, List<User>>(body
            .map<User>((json) => User.fromJson(json as Map<String, dynamic>))
            .toList() as List<User>);
      }

      return Left<UserFailure, List<User>>(
        UserFailure(
          message: 'Error: ${response.body}',
          statusCode: response.statusCode,
        ),
      );
    } catch (_) {
      return left<UserFailure, List<User>>(
          UserFailure(message: 'We did not find any users!'));
    }
  }
}
