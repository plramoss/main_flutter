import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_flutter/bloc/auth_bloc.dart';
import 'package:main_flutter/bloc/auth_event.dart';
import 'package:main_flutter/bloc/auth_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogoutRequested());
                },
                icon: const Icon(Icons.logout)
              );
            }
          ),
        ],
      ),
      body: const Center(child: Text('Welcome'),),
    );
  }
}