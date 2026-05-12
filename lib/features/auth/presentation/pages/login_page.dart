import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/widgets/raeya_auth_card.dart';
import '../../../../core/presentation/widgets/raeya_primary_button.dart';
import '../../../../core/presentation/widgets/raeya_social_button.dart';
import '../../../../core/presentation/widgets/raeya_text_field.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';
import 'sign_up_page.dart';
import '../../../../core/presentation/pages/main_layout_page.dart';
import '../../../parent_dashboard/presentation/pages/parent_main_layout_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [RaeyaColors.background, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo
                Image.asset(
                  'figma-ui/Raeya Logo.png',
                  height: 100,
                ),
                const SizedBox(height: 40),
                RaeyaAuthCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Welcome back',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Your digital sanctuary is just a tap away.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: RaeyaColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      RaeyaTextField(
                        label: 'Email Address',
                        hintText: 'name@example.com',
                        prefixIcon: Icons.email_outlined,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Password',
                            style: TextStyle(
                              color: RaeyaColors.textPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: RaeyaColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      RaeyaTextField(
                        label: '', // Label handled above for custom row
                        hintText: '••••••••',
                        prefixIcon: Icons.lock_outline,
                        isPassword: !_isPasswordVisible,
                        controller: _passwordController,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: RaeyaColors.textSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                          if (state is LoginSuccess) {
                            if (state.role == 'kid') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainLayoutPage()),
                              );
                            } else if (state.role == 'parent') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ParentMainLayoutPage()),
                              );
                            }
                          }
                        },
                        builder: (context, state) {
                          return RaeyaPrimaryButton(
                            text: 'Login',
                            isLoading: state is LoginLoading,
                            onPressed: () {
                              context.read<LoginCubit>().login(
                                    _emailController.text,
                                    _passwordController.text,
                                  );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(color: RaeyaColors.textSecondary),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          RaeyaSocialButton(
                            text: 'Google',
                            icon: const Icon(Icons.g_mobiledata, size: 32), // Placeholder for Google Icon
                            onPressed: () {},
                          ),
                          const SizedBox(width: 16),
                          RaeyaSocialButton(
                            text: 'Apple',
                            icon: const Icon(Icons.apple, size: 24),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New to Raeya? ',
                      style: TextStyle(color: RaeyaColors.textSecondary),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpPage()),
                        );
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: RaeyaColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  '© 2024 Sarah. Built for peace of mind.',
                  style: TextStyle(color: RaeyaColors.textSecondary, fontSize: 12),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
