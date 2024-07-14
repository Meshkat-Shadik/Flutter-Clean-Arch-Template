// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:clean_arch/core/failure/local_failure.dart';
import 'package:clean_arch/core/failure/network_failure.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/presentation/ui/screens/user_screen.dart';
import 'package:clean_arch/feature/user/presentation/viewmodel/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late MockUserBloc userBloc;

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<UserBloc>(
      create: (context) => userBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const user = User(
    id: 1,
    name: 'Leanne Graham',
    username: 'Bret',
    email: 'Sincere@april.biz',
    phone: '1-770-736-8031 x56442',
    website: 'hildegard.org',
  );

  setUp(() {
    userBloc = MockUserBloc();
    HttpOverrides.global = null;
  });
  testWidgets(
    'user screen should return SizedBox.shrink()',
    (tester) async {
      //arrange
      when(() => userBloc.state).thenReturn(const UserState.initial());
      //act
      await tester.pumpWidget(_makeTestableWidget(const UserScreen()));
      //assert
      expect(find.byKey(const Key('sized_box_initial')), findsOneWidget);
      expect(find.byKey(const Key('loading_indicator')), findsNothing);
    },
  );

  testWidgets(
    'user screen should return CircularProgressIndicator',
    (tester) async {
      //arrange
      when(() => userBloc.state).thenReturn(const UserState.loading());
      //act
      await tester.pumpWidget(_makeTestableWidget(const UserScreen()));
      //assert
      expect(find.byKey(const Key('loading_indicator')), findsOneWidget);
      expect(find.byKey(const Key('sized_box_initial')), findsNothing);
    },
  );

  testWidgets(
    'user screen should return UserProfileCard',
    (tester) async {
      //arrange
      when(() => userBloc.state).thenReturn(const UserState.data(user));
      //act
      await tester.pumpWidget(_makeTestableWidget(const UserScreen()));
      await tester.pumpAndSettle();
      //assert
      expect(find.byKey(const Key('user_profile_card')), findsOneWidget);
    },
  );

  testWidgets(
    'user screen should return Text with error message',
    (tester) async {
      //arrange
      const failure = NetworkFailure(
        message: 'Network Failure',
        name: 'Network Failure',
        uriPath: 'uriPath',
        code: 404,
      );
      when(() => userBloc.state).thenReturn(const UserState.error(failure));
      //act
      await tester.pumpWidget(_makeTestableWidget(const UserScreen()));
      //assert
      expect(find.byKey(const Key('error_message')), findsOneWidget);
      final errorMessageWidget =
          tester.widget<Text>(find.byKey(const Key('error_message')));
      expect(errorMessageWidget.data, equals(failure.message));
    },
  );

  testWidgets(
    'user screen should return Text with error message',
    (tester) async {
      //arrange
      const failure = LocalFailure(
        message: 'Local Failure',
        name: 'Runtime Error: Division by zero',
      );
      when(() => userBloc.state).thenReturn(const UserState.error(failure));
      //act
      await tester.pumpWidget(_makeTestableWidget(const UserScreen()));
      //assert
      expect(find.byKey(const Key('error_message')), findsOneWidget);
      final errorMessageWidget =
          tester.widget<Text>(find.byKey(const Key('error_message')));
      expect(errorMessageWidget.data, equals(failure.message));
    },
  );
}
