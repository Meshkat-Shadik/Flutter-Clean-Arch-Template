import 'package:clean_arch/core/failure/network_failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clean_arch/feature/user/domain/entity/user.dart';
import 'package:clean_arch/feature/user/domain/repository/user_repository.dart';
import 'package:clean_arch/feature/user/domain/usecase/get_user_usecase.dart';

// Mock class for UserRepository
class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUserUsecase getUserUsecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserUsecase = GetUserUsecase(mockUserRepository);
  });

  const tUserId = 1;
  const tUser = User(
    id: tUserId,
    name: 'Leanne Graham',
    username: 'Bret',
    email: 'Sincere@april.biz',
    phone: '1-770-736-8031 x56442',
    website: 'hildegard.org',
  );

  test('should get User from the repository', () async {
    // Arrange
    when(() => mockUserRepository.getUser(tUserId))
        .thenAnswer((_) async => const Right(tUser));

    // Act
    final result = await getUserUsecase(tUserId);

    // Assert
    expect(result, const Right(tUser));
    verify(() => mockUserRepository.getUser(tUserId)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return failure when repository returns an error', () async {
    // Arrange
    const tFailure = NetworkFailure(
      name: 'NetworkFailure',
      message: 'Network Error',
      uriPath: '/users/$tUserId',
      code: 404,
    );
    when(() => mockUserRepository.getUser(tUserId))
        .thenAnswer((_) async => const Left(tFailure));

    // Act
    final result = await getUserUsecase(tUserId);

    // Assert
    expect(result, const Left(tFailure));
    verify(() => mockUserRepository.getUser(tUserId)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}
