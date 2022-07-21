part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.status,
  });
  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  final String email;
  final String password;
  final LoginStatus status;

  @override
  List<Object> get props => [email, password, status];

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
