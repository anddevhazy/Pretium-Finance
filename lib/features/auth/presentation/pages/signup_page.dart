import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretium/features/app/const_colours/colors.dart';
import 'package:pretium/features/auth/domain/entities/user_entity.dart';
import 'package:pretium/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:pretium/features/routes/route_names.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _hiddenPassword = true;
  bool _acceptTerms = false;

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final formWidth = screenWidth > 600 ? 500.0 : screenWidth * 0.9;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Successful) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: primaryColour,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
              content: Text(
                state.message ?? 'Sign-up successful!',
                style: const TextStyle(
                  color: whiteColour,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          );
          Navigator.pushNamed(context, RouteNames.createPin);
        } else if (state is Failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: redColour,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              duration: const Duration(seconds: 2),
              content: Text(
                state.message ?? 'Sign-up failed',
                style: const TextStyle(
                  color: whiteColour,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whiteColour,
          appBar: AppBar(
            backgroundColor: whiteColour,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: primaryColour),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: formWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Create Account ',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: blackColour,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          ' Simplify your crypto payments with us',
                          style: TextStyle(
                            fontSize: 16,
                            color: blackColour,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(height: 32),

                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            labelText: 'First Name',
                            labelStyle: const TextStyle(
                              color: greyColour,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColour,
                                width: 2,
                              ),
                            ),

                            prefixIcon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: greyColour),
                            ),
                            filled: true,
                            fillColor: whiteColour,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            labelText: 'Last Name',
                            labelStyle: const TextStyle(
                              color: greyColour,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColour,
                                width: 2,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: greyColour),
                            ),
                            filled: true,
                            fillColor: whiteColour,

                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter your last name';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'example@gmail.com',
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              color: greyColour,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColour,
                                width: 2,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: greyColour),
                            ),
                            filled: true,
                            fillColor: whiteColour,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter your email';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _passwordController,
                          obscureText: _hiddenPassword,
                          decoration: InputDecoration(
                            helperText: '8+ characters',
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: greyColour,
                              fontFamily: 'Roboto',
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: primaryColour,
                                width: 2,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _hiddenPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _hiddenPassword = !_hiddenPassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: greyColour),
                            ),
                            filled: true,
                            fillColor: whiteColour,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ' Please enter a password';
                            }
                            if (value.length < 8) {
                              return ' Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 16),

                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _acceptTerms,
                                activeColor: primaryColour,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _acceptTerms = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 8),

                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Accept Terms and Conditions',
                                  style: TextStyle(
                                    color: primaryColour,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed:
                                state is Loading
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate() &&
                                          _acceptTerms) {
                                        final userEntity = UserEntity(
                                          firstName: _firstNameController.text,
                                          lastName: _lastNameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        );
                                        context.read<AuthCubit>().signUp(
                                          userEntity: userEntity,
                                        );
                                      } else if (!_acceptTerms) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: redColour,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            duration: const Duration(
                                              seconds: 2,
                                            ),
                                            content: const Text(
                                              'Please accept the terms and conditions',
                                              style: TextStyle(
                                                color: whiteColour,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColour,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: whiteColour,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(color: blackColour),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RouteNames.logIn,
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: primaryColour,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
