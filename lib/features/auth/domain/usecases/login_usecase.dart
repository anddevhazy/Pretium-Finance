import 'package:pretium/features/auth/domain/entities/user_entity.dart';
import 'package:pretium/features/auth/domain/repository/user_repository.dart';

class LogInUseCase {
  final UserRepository repository;

  LogInUseCase({required this.repository});

  Future<bool> call(UserEntity userEntity) async {
    return await repository.logIn(userEntity);
  }
}
