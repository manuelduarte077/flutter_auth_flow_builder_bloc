import 'package:flutter/material.dart';
import 'package:flutter_auth_flow_builder_bloc/cubits/cubits.dart';
import 'package:flutter_auth_flow_builder_bloc/repositories/auth_repository.dart';
import 'package:flutter_auth_flow_builder_bloc/screens/auth/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
          create: (_) => LoginCubit(
            context.read<AuthRepository>(),
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          const Center(child: Text('Error'));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _EmailInput(),
          const SizedBox(height: 8),
          _PasswordInput(),
          const SizedBox(height: 8),
          _LoginButton(),
          const SizedBox(height: 8),
          _SignupButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: 'Email'),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: 'Password'),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().logInWithCredentials();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40),
                ),
                child: const Text('Login'),
              );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push<void>(
        SignupScreen.route(),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        fixedSize: const Size(200, 40),
      ),
      child: const Text(
        'Create Account',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
