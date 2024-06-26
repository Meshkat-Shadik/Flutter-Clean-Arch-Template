import 'package:clean_arch/feature/user/presentation/ui/screens/user_screen.dart';
import 'package:clean_arch/feature/user/presentation/viewmodel/user_bloc/user_bloc.dart';
import 'package:clean_arch/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<UserBloc>(
        create: (context) => getIt<UserBloc>()..add(const WatchUserById(1)),
        child: const UserScreen(),
      ),
    );
  }
}
