import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_flutter/views/home_view.dart';
import 'package:main_flutter/views/login_view.dart';
import 'bloc/auth_bloc.dart';
import 'bloc/auth_state.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedOut) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginView()),
            (route) => false,
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const CircularProgressIndicator();
          } else if (state is AuthAuthenticated) {
            return const HomeView();
          } else {
            return LoginView();
          }
        },
      ),
    );
  }
}