import 'package:get_it/get_it.dart';
import 'package:raeya_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:raeya_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:raeya_mobile/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:raeya_mobile/features/auth/presentation/cubit/login_cubit.dart';
import 'package:raeya_mobile/features/auth/presentation/cubit/sign_up_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:raeya_mobile/core/error/failures.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => SignUpCubit(signUpUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

// Temporary Mock Implementation
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'kid' && password == 'kid') {
      return const Right('child');
    }
    // Default mock success
    return const Right('parent');
  }

  @override
  Future<Either<Failure, void>> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }
}
