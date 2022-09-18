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
    final theme = Theme.of(context);
    final sheme = theme.colorScheme;
    final styles = theme.textTheme;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          const Center(child: Text('Error'));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Icon(
              Icons.face,
              size: 80,
              color: sheme.tertiary,
            ),
            const Spacer(),
            Text(
              'Login',
              style: styles.headlineLarge,
            ),
            const SizedBox(height: 24),
            _EmailInput(),
            const SizedBox(height: 24),
            _PasswordInput(),
            const SizedBox(height: 16),
            _LoginButton(),
            const SizedBox(height: 24),
            _SignupButton(),
            const Spacer(
              flex: 2,
            )
          ],
        ),
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
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            labelText: 'Email',
          ),
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
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline_rounded),
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility_off_outlined),
            ),
          ),
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
                child: const Text('Login'),
              );
      },
    );
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Navigator.of(context).push(SignupScreen.route()),
        child: const Text('Create Account'),
      ),
    );
  }
}
