import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required bool agreedToTerms,
  }) async {
    if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      emit(const SignUpFailure('Please fill in all fields'));
      return;
    }

    if (password != confirmPassword) {
      emit(const SignUpFailure('Passwords do not match'));
      return;
    }

    if (!agreedToTerms) {
      emit(const SignUpFailure('You must agree to the Terms and Conditions'));
      return;
    }

    emit(SignUpLoading());

    final result = await signUpUseCase.execute(
      fullName: fullName,
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (_) => emit(SignUpSuccess()),
    );
  }
}
