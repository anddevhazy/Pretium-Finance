import 'package:pretium/features/auth/domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  Future<bool> signUp(UserEntity userEntity);
  Future<bool> logIn(UserEntity userEntity);
  Future<bool> createPin(String email, int pin);
}
