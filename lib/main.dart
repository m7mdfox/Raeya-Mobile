import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'core/theme/raeya_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/cubit/login_cubit.dart';
import 'features/auth/presentation/cubit/sign_up_cubit.dart';

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
        BlocProvider(create: (_) => di.sl<LoginCubit>()),
        BlocProvider(create: (_) => di.sl<SignUpCubit>()),
      ],
      child: MaterialApp(
        title: 'Raeya',
        debugShowCheckedModeBanner: false,
        theme: RaeyaTheme.lightTheme,
        home: const LoginPage(),
      ),
    );
  }
}
