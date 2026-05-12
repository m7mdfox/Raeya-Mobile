import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, void>> execute({
    required String fullName,
    required String email,
    required String password,
  }) {
    return repository.register(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
