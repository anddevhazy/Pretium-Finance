import 'package:get_it/get_it.dart';
import 'package:pretium/features/auth/auth_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await authInjectionContainer();
}
