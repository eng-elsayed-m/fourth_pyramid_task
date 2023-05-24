part of "bloc.dart";

abstract class LoginEvent extends Equatable {}

class LoginButtonPressedEvent extends LoginEvent {
  final UserEntity user;

  LoginButtonPressedEvent({required this.user});
  @override
  List<Object?> get props => [user];
}
