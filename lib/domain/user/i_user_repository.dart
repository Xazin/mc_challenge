import 'package:mc_challenge/common/types/either.dart';
import 'package:mc_challenge/domain/user/user.dart';

abstract class IUserRepository {
  Future<Either<String, List<User>>> getUsers();
}
