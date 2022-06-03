import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/i_user_repository.dart';
import 'package:mc_challenge/domain/user/user.dart';

// TODO: would use environment variables here
const String baseUrl = 'https://jsonplaceholder.typicode.com/users';

class UserRepository implements IUserRepository {
  // TODO: would lazy instantiate a singleton instead of creating a new instance every time
  final http.Client client;

  UserRepository(this.client);

  @override
  Future<Either<String, List<User>>> getUsers() async {
    try {
      final response = await client.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        return right<String, List<User>>(body
            .map<User>((json) => User.fromJson(json as Map<String, dynamic>))
            .toList() as List<User>);
      }

      return Left<String, List<User>>('Error: ${response.body}');
    } catch (_) {
      return left<String, List<User>>('We did not find any users!');
    }
  }
}
