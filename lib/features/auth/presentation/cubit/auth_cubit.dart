import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pretium/features/auth/domain/entities/user_entity.dart';
import 'package:pretium/features/auth/domain/usecases/create_pin_usecase.dart';
import 'package:pretium/features/auth/domain/usecases/login_usecase.dart';
import 'package:pretium/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  final LogInUseCase logInUseCase;
  final CreatePinUsecase createPinUsecase;

  AuthCubit({
    required this.signUpUseCase,
    required this.logInUseCase,
    required this.createPinUsecase,
  }) : super(Initial());

  Future<void> signUp({required UserEntity userEntity}) async {
    emit(Loading(userEntity: userEntity));
    try {
      final result = await signUpUseCase(userEntity);
      if (result) {
        emit(const Successful(message: 'Sign-up successful!'));
      } else {
        emit(const Failed(message: 'Sign-up failed. Please try again.'));
      }
    } catch (e) {
      emit(Failed(message: 'An error occurred: ${e.toString()}'));
    }
  }

  Future<void> logIn({required UserEntity userEntity}) async {
    emit(Loading(userEntity: userEntity));
    try {
      final result = await logInUseCase(userEntity);
      if (result) {
        emit(const Successful(message: 'Login successful!'));
      } else {
        emit(const Failed(message: 'Login failed. Invalid email or password.'));
      }
    } catch (e) {
      emit(Failed(message: 'An error occurred: ${e.toString()}'));
    }
  }

  Future<void> createPin({required String email, required int pin}) async {}
}
