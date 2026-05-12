import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(const LoginFailure('Please fill in all fields'));
      return;
    }

    emit(LoginLoading());

    // Hardcoded credentials for development
    final lowerEmail = email.toLowerCase().trim();
    final lowerPassword = password.trim();

    if ((lowerEmail == 'kid' || lowerEmail == 'child') && lowerPassword == 'kid') {
      emit(const LoginSuccess('kid'));
    } else if (lowerEmail == 'parent' && lowerPassword == 'parent') {
      emit(const LoginSuccess('parent'));
    } else {
      emit(const LoginFailure('Invalid credentials'));
    }
  }
}
