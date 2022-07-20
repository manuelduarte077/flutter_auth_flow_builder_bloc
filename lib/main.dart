import 'package:flutter/material.dart';
import 'package:flutter_auth_flow_builder_bloc/app/app.dart';
import 'package:flutter_auth_flow_builder_bloc/bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}
