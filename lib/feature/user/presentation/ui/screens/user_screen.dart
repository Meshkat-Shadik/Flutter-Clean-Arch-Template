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
                  initial: () => const SizedBox.shrink(
                    key: Key('sized_box_initial'),
                  ),
                  loading: () => const CircularProgressIndicator(
                    key: Key('loading_indicator'),
                  ),
                  data: (user) => UserProfileCard(
                    key: const Key('user_profile_card'),
                    user: user,
                  ),
                  error: (failure) {
                    return Column(
                      children: [
                        Text(
                          failure.message,
                          key: const Key('error_message'),
                        ),
                        Text(
                          failure.name,
                          key: const Key('error_name'),
                        ),
                        Text(
                          failure.uriPath.toString(),
                          key: const Key('error_uri_path'),
                        ),
                        Text(
                          failure.code.toString(),
                          key: const Key('error_code'),
                        ),
                      ],
                    );
                  },
                  orElse: () => const SizedBox.shrink(
                    key: Key('sized_box_or_else'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
