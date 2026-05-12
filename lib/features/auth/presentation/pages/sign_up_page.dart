import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/widgets/raeya_auth_card.dart';
import '../../../../core/presentation/widgets/raeya_primary_button.dart';
import '../../../../core/presentation/widgets/raeya_text_field.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../cubit/sign_up_cubit.dart';
import '../cubit/sign_up_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmVisible = false;
  bool _agreedToTerms = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                const SizedBox(height: 20),
                // Logo
                Image.asset(
                  'figma-ui/Raeya Logo.png',
                  height: 120,
                ),
                const SizedBox(height: 20),
                RaeyaAuthCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Create your account',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Start your journey into a safer digital world.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: RaeyaColors.textSecondary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      RaeyaTextField(
                        label: 'FULL NAME',
                        hintText: 'Alex Johnson',
                        prefixIcon: Icons.person_outline,
                        controller: _fullNameController,
                      ),
                      const SizedBox(height: 20),
                      RaeyaTextField(
                        label: 'EMAIL ADDRESS',
                        hintText: 'alex@example.com',
                        prefixIcon: Icons.alternate_email,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      RaeyaTextField(
                        label: 'PASSWORD',
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
                      const SizedBox(height: 20),
                      RaeyaTextField(
                        label: 'CONFIRM',
                        hintText: '••••••••',
                        prefixIcon: Icons.vpn_key_outlined,
                        isPassword: !_isConfirmVisible,
                        controller: _confirmPasswordController,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmVisible ? Icons.visibility : Icons.visibility_off,
                            color: RaeyaColors.textSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _isConfirmVisible = !_isConfirmVisible;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: _agreedToTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreedToTerms = value ?? false;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  color: RaeyaColors.textSecondary,
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                                children: [
                                  const TextSpan(text: 'I agree to the '),
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: const TextStyle(
                                      color: RaeyaColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: ' and acknowledge the '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: const TextStyle(
                                      color: RaeyaColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const TextSpan(text: '.'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      BlocConsumer<SignUpCubit, SignUpState>(
                        listener: (context, state) {
                          if (state is SignUpFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          }
                          if (state is SignUpSuccess) {
                            // Navigate to success or home
                          }
                        },
                        builder: (context, state) {
                          return RaeyaPrimaryButton(
                            text: 'Create Account',
                            suffixIcon: Icons.arrow_forward,
                            isLoading: state is SignUpLoading,
                            onPressed: () {
                              context.read<SignUpCubit>().signUp(
                                    fullName: _fullNameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    confirmPassword: _confirmPasswordController.text,
                                    agreedToTerms: _agreedToTerms,
                                  );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Raeya uses professional-grade encryption to protect your family’s data. Your children’s safety is our primary mission.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: RaeyaColors.textSecondary,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: RaeyaColors.textSecondary),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: RaeyaColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
