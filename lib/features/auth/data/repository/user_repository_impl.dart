import 'package:pretium/features/auth/data/remote/user_remote_data_source.dart';
import 'package:pretium/features/auth/domain/entities/user_entity.dart';
import 'package:pretium/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<bool> signUp(UserEntity userEntity) async =>
      remoteDataSource.signUp(userEntity);

  @override
  Future<bool> logIn(UserEntity userEntity) async =>
      remoteDataSource.logIn(userEntity);

  @override
  Future<bool> createPin(String email, int pin) async =>
      remoteDataSource.createPin(email, pin);
}
