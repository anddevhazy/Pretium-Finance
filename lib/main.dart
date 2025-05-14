import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretium/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:pretium/features/routes/on_generate_routes.dart';
import 'package:pretium/features/routes/route_names.dart';
import 'main_injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<AuthCubit>(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),

        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: OnGenerateRoutes.generate,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
