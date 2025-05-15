import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretium/features/app/Theme/them_cubit.dart';
import 'package:pretium/features/app/theme/app_theme.dart';
import 'package:pretium/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:pretium/features/routes/on_generate_routes.dart';
import 'package:pretium/features/routes/route_names.dart';
import 'main_injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthCubit>()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          final themeCubit = BlocProvider.of<ThemeCubit>(context);
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeCubit.themeMode,
            initialRoute: RouteNames.splashScreen,
            onGenerateRoute: OnGenerateRoutes.generate,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
