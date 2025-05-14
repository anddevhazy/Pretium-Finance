import 'package:pretium/features/auth/data/remote/user_remote_data_source.dart';
import 'package:pretium/features/auth/data/remote/user_remote_data_source_impl.dart';
import 'package:pretium/features/auth/data/repository/user_repository_impl.dart';
import 'package:pretium/features/auth/domain/repository/user_repository.dart';
import 'package:pretium/features/auth/domain/usecases/create_pin_usecase.dart';
import 'package:pretium/features/auth/domain/usecases/login_usecase.dart';
import 'package:pretium/features/auth/domain/usecases/signup_usecase.dart';
import 'package:pretium/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:pretium/main_injection_container.dart';

Future<void> authInjectionContainer() async {
  // * CUBITS INJECTION

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      signUpUseCase: sl.call(),
      logInUseCase: sl.call(),
      createPinUsecase: sl.call(),
    ),
  );

  // * USE CASES INJECTION

  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<LogInUseCase>(
    () => LogInUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<CreatePinUsecase>(
    () => CreatePinUsecase(repository: sl.call()),
  );

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl.call()),
  );

  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(),
  );
}
