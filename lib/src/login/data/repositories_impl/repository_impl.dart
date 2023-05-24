part of "../../login.dart";

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserEntity>> login(UserEntity params) async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      return Right(params);
    } on ServerException {
      return const Left(ServerFailure("Login Failed!"));
    }
  }
}
