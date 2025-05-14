import 'package:pretium/features/auth/domain/entities/user_entity.dart';
import 'package:pretium/features/auth/domain/repository/user_repository.dart';

class SignUpUseCase {
  final UserRepository repository;

  SignUpUseCase({required this.repository});

  Future<bool> call(UserEntity userEntity) async {
    return await repository.signUp(userEntity);
  }
}
