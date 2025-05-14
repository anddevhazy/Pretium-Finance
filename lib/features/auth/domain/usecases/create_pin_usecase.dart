import 'package:pretium/features/auth/domain/repository/user_repository.dart';

class CreatePinUsecase {
  final UserRepository repository;

  CreatePinUsecase({required this.repository});

  Future<bool> call(String email, int pin) async {
    return await repository.createPin(email, pin);
  }
}
