import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_examplee/app/features/login/presentation/login_page.dart';
import 'package:riverpod_examplee/app/features/rick_and_morty/presentation/list_character_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Riverpod Example', home: const _ChoiceFeature());
  }
}

class _ChoiceFeature extends StatelessWidget {
  const _ChoiceFeature();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choice'), elevation: 8),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  ),
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ListCharacterPage(),
                    ),
                  ),
              child: Text('Rick & Morty'),
            ),
          ],
        ),
      ),
    );
  }
}
