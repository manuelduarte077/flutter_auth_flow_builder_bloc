import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SignupForm(),
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _EmailInput(),
        const SizedBox(height: 8),
        _PasswordInput(),
        const SizedBox(height: 8),
        _SignupButton(),
        const SizedBox(height: 8),
        _SignupButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
