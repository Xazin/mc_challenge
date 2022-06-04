import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/user.dart';
import 'package:mc_challenge/domain/user/user_failure.dart';

abstract class IUserRepository {
  Future<Either<UserFailure, List<User>>> getUsers();
}
