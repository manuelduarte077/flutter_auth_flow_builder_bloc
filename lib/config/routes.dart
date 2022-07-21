import 'package:flutter/widgets.dart';
import 'package:flutter_auth_flow_builder_bloc/blocs/app/app_bloc.dart';
import 'package:flutter_auth_flow_builder_bloc/screens/auth/login_screen.dart';
import 'package:flutter_auth_flow_builder_bloc/screens/home/home_screen.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
