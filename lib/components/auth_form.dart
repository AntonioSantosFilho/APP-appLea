import 'package:applealogin/pages/menu_page.dart';
import 'package:flutter/material.dart';

import '../models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _FormData = AuthFormData();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MenuPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (_FormData.isSignup)
                      TextFormField(
                        key: const ValueKey('name'),
                        initialValue: _FormData.name,
                        onChanged: (name) => _FormData.name = name,
                        decoration: const InputDecoration(labelText: 'Nome'),
                        validator: (_name) {
                          final name = _name ?? '';
                          if (name.trim().length < 5) {
                            return 'Nome deve ter no mínimo 5 caracteres.';
                          }
                          return null;
                        },
                      ),
                    TextFormField(
                      key: const ValueKey('email'),
                      initialValue: _FormData.email,
                      onChanged: (email) => _FormData.name = email,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      validator: (_email) {
                        final email = _email ?? '';
                        if (!email.contains('@')) {
                          return 'Informe um e-mail válido.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: const ValueKey('password'),
                      initialValue: _FormData.password,
                      onChanged: (password) => _FormData.name = password,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Senha'),
                      validator: (_password) {
                        final password = _password ?? '';
                        if (password.length < 6) {
                          return 'Senha deve ter no mínimo 6 caracteres.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: Text(_FormData.isLogin ? 'Entrar' : 'Cadastrar',
                          style: const TextStyle(color: Colors.white)),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _FormData.toggleAuthMode();
                          });
                        },
                        child: Text(_FormData.isLogin
                            ? 'Criar uma nova conta?'
                            : 'Já possui conta?')),
                  ],
                )),
          )),
    );
  }
}
