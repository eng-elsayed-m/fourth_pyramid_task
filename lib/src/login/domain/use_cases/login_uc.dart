part of "../../login.dart";

class LoginUC implements UseCase<UserEntity, UserEntity> {
  final AuthRepository repository;
  LoginUC(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserEntity params) async {
    return await repository.login(params);
  }
}
