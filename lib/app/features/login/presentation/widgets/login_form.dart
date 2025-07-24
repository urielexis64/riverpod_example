import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/login_providers.dart';

/// A form for user login.
class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    // Initialize controllers or any other state if needed.
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
        ],
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
