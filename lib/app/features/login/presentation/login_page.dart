import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplee/app/features/login/providers/login_provider.dart';

/// UI for the login screen, using Riverpod for state management.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: _emptyValidator,
                controller: _emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: _emptyValidator,
                controller: _passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onLoginPressed,
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final user = ref.watch(loginProvider);
                  return user.when(
                    data: (data) => Text('User: ${data?.email}'),
                    error: (error, stackTrace) => Text('Error: $error'),
                    loading: () => const CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginPressed() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final provider = ref.read(loginProvider.notifier);

    final email = _emailController.text;
    final password = _passwordController.text;

    await provider.login(email, password);
  }

  String? _emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }
}
