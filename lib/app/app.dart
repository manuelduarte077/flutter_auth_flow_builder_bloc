import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_flow_builder_bloc/blocs/app/app_bloc.dart';
import 'package:flutter_auth_flow_builder_bloc/config/routes.dart';
import 'package:flutter_auth_flow_builder_bloc/repositories/auth_repository.dart';
import 'package:flutter_auth_flow_builder_bloc/screens/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
