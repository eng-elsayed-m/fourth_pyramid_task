part of "../../login.dart";

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(UserEntity params);
}
