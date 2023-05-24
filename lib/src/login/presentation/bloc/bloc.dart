import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task/core/consts/consts.dart';
import 'package:fourth_pyramid_task/src/login/login.dart';

part 'state.dart';
part 'event.dart';

class AuthenticationBloc extends Bloc<LoginEvent, AuthState> {
  final LoginUC loginUC;

  AuthenticationBloc({required this.loginUC}) : super(AuthInitial()) {
    on<LoginButtonPressedEvent>(_login);
  }
  FutureOr<void> _login(
      LoginButtonPressedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final admin = await loginUC.call(event.user);
      emit(admin.fold((l) => AuthFailure(_mapFailureToMessage(l)), (r) {
        return AuthSuccess(r);
      }));
    } on Exception catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      case CacheFailure:
        return failure.message;

      default:
        return 'Unexpected error';
    }
  }
}
