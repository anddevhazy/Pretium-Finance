part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class Initial extends AuthState {
  @override
  List<Object> get props => [];
}

class Loading extends AuthState {
  final UserEntity userEntity;

  const Loading({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class Successful extends AuthState {
  final String? message;

  const Successful({this.message});

  @override
  List<Object?> get props => [message];
}

class Failed extends AuthState {
  final String? message;

  const Failed({this.message});

  @override
  List<Object?> get props => [message];
}
