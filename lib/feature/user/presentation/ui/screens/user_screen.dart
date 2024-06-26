import 'package:clean_arch/feature/user/presentation/ui/widgets/user_profile_card.dart';
import 'package:clean_arch/feature/user/presentation/viewmodel/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<UserBloc, UserState>(
              listener: (context, user) {},
              builder: (context, user) {
                return user.maybeWhen(
                  loading: () => const CircularProgressIndicator(),
                  loaded: (user) => UserProfileCard(user: user),
                  error: (failure) => Text(failure.message),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
