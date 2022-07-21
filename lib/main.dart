import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_flow_builder_bloc/app/app.dart';
import 'package:flutter_auth_flow_builder_bloc/bloc_observer.dart';
import 'package:flutter_auth_flow_builder_bloc/firebase_options.dart';
import 'package:flutter_auth_flow_builder_bloc/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authRepository = AuthRepository();

      runApp(MyApp(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}
