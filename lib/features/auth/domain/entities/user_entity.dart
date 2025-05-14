import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  // final String uid; since I'm not implementing any API yet
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final int? pin;

  const UserEntity({
    required this.password,
    // required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.pin,
  });

  UserEntity copyWith({
    // String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    int? pin,
  }) {
    return UserEntity(
      // uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      pin: pin ?? this.pin,
    );
  }

  @override
  List<Object?> get props => [
    // uid,
    password, firstName, lastName, email, pin,
  ];
}
