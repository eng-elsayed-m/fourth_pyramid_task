part of "../../login.dart";

class UserEntity extends Equatable {
  final String phone;
  final String password;

  const UserEntity({required this.phone, required this.password});

  @override
  List<Object> get props => [phone, password];
}
