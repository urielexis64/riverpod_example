import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplee/app/features/login/presentation/widgets/login_form.dart';

import '../providers/login_providers.dart';

/// UI for the login screen, using Riverpod for state management.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LoginForm(),
            const SizedBox(height: 20),
            Consumer(
              builder: (context, ref, child) {
                final user = ref.watch(loginProvider);
                return user.when(
                  data: (data) => Text('User: ${data?.email}'),
                  error: (error, _) => Text('Error: $error'),
                  loading: () => const CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
