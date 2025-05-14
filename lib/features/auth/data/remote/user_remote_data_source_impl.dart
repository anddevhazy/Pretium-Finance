import 'package:pretium/features/auth/data/remote/user_remote_data_source.dart';
import 'package:pretium/features/auth/domain/entities/user_entity.dart';

// success and failure situations gently implemented for state management

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<bool> signUp(UserEntity userEntity) async {
    await Future.delayed(const Duration(seconds: 5));
    if (userEntity.email.contains('tinubu')) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> logIn(UserEntity userEntity) async {
    await Future.delayed(const Duration(seconds: 5));
    if (userEntity.email.contains('tinubu')) {
      return false;
    }
    return true;
  }

  @override
  Future<bool> createPin(String email, int pin) async {
    await Future.delayed(const Duration(seconds: 2));

    if (pin >= 5000) {
      return false;
    }
    return true;
  }
}
